//
//  AlamofireViewController.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 08.11.2020.
//

import UIKit
import Alamofire
class AlamofireViewController: UIViewController {
    
    //MARK: Переносим необходимые элементы сториборда в контроллер для работы с ними
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Задаем необходимые переменные
    let gradientLayer = CAGradientLayer()
    var forcastWeatherDataArray = [List]()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)
        getCurrentWeatherData()
        getForecastWeatherData()
    }
    
    //MARK: Задаем градиент
    override func viewWillAppear(_ animated: Bool) {
        gradientBackground()
    }
    
    //MARK: Создаем градиент
    func gradientBackground(){
        let topColor = UIColor.systemTeal.cgColor
        let bottomColor = UIColor.systemBlue.cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
    //MARK: Работаем с API текущей погоды и задаем параметры элементам интерфейса
    func getCurrentWeatherData(){
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?q=moscow&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: WeatherData.self) { (response) in
            guard let currentWeather = response.value else { return }
            DispatchQueue.main.async {
                self.cityNameLabel.text = "\(currentWeather.name)"
                self.weatherDescriptionLabel.text = "\(currentWeather.weather[0].description)"
                self.tempLabel.text = "\(currentWeather.main.temp.rounded())"
                self.iconImageView.image = UIImage(named: "\(currentWeather.weather[0].icon)")
            }
        }
    }
    
    //MARK: Работаем с API прогноза погода на 16 дней вперед и задаем параметры элементам таблицы
    func getForecastWeatherData(){
        let request = AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&&cnt=16&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: ForecastWeatherData.self) { (response) in
            guard let forecastWeather = response.value else { return }
            self.forcastWeatherDataArray = forecastWeather.list
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: Работаем с таблицей
extension AlamofireViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcastWeatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireCell") as! AlmofireCellTableViewCell
        cell.dataLabel.text = forcastWeatherDataArray[indexPath.row].dt_txt
        cell.tableTempLabel.text = "\(forcastWeatherDataArray[indexPath.row].main.temp.rounded())"
        cell.iconImage.image = UIImage(named: "\(forcastWeatherDataArray[indexPath.row].weather[0].icon)")
        return cell
    }
}
