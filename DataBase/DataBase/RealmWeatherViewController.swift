//
//  RealmWeatherViewController.swift
//  DataBase
//
//  Created by Даниил Алексеев on 16.11.2020.
//
import RealmSwift
import UIKit

class RealmWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var currentWeatherCondition: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherTemp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    let gradientLayer = CAGradientLayer()
    var forcastWeatherDataArray = [List]()
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeatherData()
        getForecastWeatherData()
        backgroundView.layer.addSublayer(gradientLayer)
        render()
    }
    
    func render(){
        let currentWeatherData = realm.objects(realmWeatherData.self)
        for data in currentWeatherData{
            currentWeatherCondition.text = data.currentWeatherDescription
            currentWeatherTemp.text = data.currentWeatherTemp
            cityNameLabel.text = data.cityName
            weatherIcon.image = UIImage(named: "\(data.currentWeatherIcon)")
        }
    }
    
    //MARK: Задаем градиент
    override func viewWillAppear(_ animated: Bool) {
        gradientBackground()
    }
    
    //MARK: Создаем градиент
    func gradientBackground(){
        let topColor = UIColor.systemYellow.cgColor
        let bottomColor = UIColor.systemOrange.cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
    //MARK: Работаем с API текущей погоды и задаем параметры элементам интерфейса
    func getCurrentWeatherData(){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=moscow&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let currentWeather = try decoder.decode(WeatherData.self, from: data!)
                    DispatchQueue.main.async {
                        self.cityNameLabel.text = "\(currentWeather.name)"
                        self.currentWeatherCondition.text = "\(currentWeather.weather[0].description)"
                        self.currentWeatherTemp.text = "\(currentWeather.main.temp.rounded())"
                        self.weatherIcon.image = UIImage(named: "\(currentWeather.weather[0].icon)")
                        
                        func save(){
                            let condition = realmWeatherData()
                            condition.currentWeatherDescription = currentWeather.weather[0].description
                            condition.currentWeatherTemp = "\(currentWeather.main.temp.rounded())"
                            condition.cityName = "\(currentWeather.name)"
                            condition.currentWeatherIcon = "\(currentWeather.weather[0].icon)"
                            self.realm.beginWrite()
                            self.realm.add(condition)
                            try! self.realm.commitWrite()
                        }
                        save()
                    }
                }
                catch{
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
    
    //MARK: Работаем с API прогноза погода на 16 дней вперед и задаем параметры элементам таблицы
    func getForecastWeatherData(){
        
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&&cnt=16&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let forecastWeather = try decoder.decode(ForecastWeatherData.self, from: data!)
                    self.forcastWeatherDataArray = forecastWeather.list
                    DispatchQueue.main.async {
                        self.tableView.reloadData()                        
                    }
                }
                catch{
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
}

//MARK: Работаем с таблицей
extension RealmWeatherViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcastWeatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ForecastTableviewCellTableViewCell
        func saveForecast(){
           let forecast = realmForecastData()
            forecast.forecastWeatherTemp = "\(forcastWeatherDataArray[indexPath.row].main.temp.rounded())"
            forecast.forecastDate = forcastWeatherDataArray[indexPath.row].dt_txt
            forecast.forecastWeatherIcon = "\(forcastWeatherDataArray[indexPath.row].weather[0].icon)"

            self.realm.beginWrite()
            self.realm.add(forecast)
            try! self.realm.commitWrite()
       }
        func renderForecast(){
            let forecastWeatherData = realm.objects(realmForecastData.self)
            for data in forecastWeatherData{
                cell.dayLabel.text = data.forecastDate
                cell.tempLabel.text = data.forecastWeatherTemp
                cell.weatherIconImageView.image = UIImage(named: "\(data.forecastWeatherIcon)")
            }
        }
        renderForecast()
        saveForecast()
        return cell
    }
}

