//
//  ViewController.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Переносим необходимые элементы сториборда в контроллер для работы с ними
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var currentWeatherCondition: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherTemp: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    //MARK: Задаем необходимые переменные
    let gradientLayer = CAGradientLayer()
    var forcastWeatherDataArray = [List]()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeatherData()
        getForecastWeatherData()
        backgroundView.layer.addSublayer(gradientLayer)
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
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcastWeatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ForecastTableviewCellTableViewCell
        cell.dayLabel.text = forcastWeatherDataArray[indexPath.row].dt_txt
        cell.tempLabel.text = "\(forcastWeatherDataArray[indexPath.row].main.temp.rounded())"
        cell.weatherIconImageView.image = UIImage(named: "\(forcastWeatherDataArray[indexPath.row].weather[0].icon)")
        return cell
    }
}
