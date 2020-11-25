//
//  WeatherService.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 25.11.2020.
//

import Foundation
import Alamofire

protocol WeatherService  {
    func currentWeather()
    func forecastWeather() 
}

class URLSessionWeatherService: WeatherService{
    var forcastWeatherDataArray = [List]()
    var cityNamelabel: String = ""
    
    func currentWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=moscow&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let currentWeather = try decoder.decode(WeatherData.self, from: data!)
                    self.cityNamelabel = currentWeather.name

//                
//                                        DispatchQueue.main.async {
//                                            self.cityNameLabel.text = "\(currentWeather.name)"
//                                            self.currentWeatherCondition.text = "\(currentWeather.weather[0].description)"
//                                            self.currentWeatherTemp.text = "\(currentWeather.main.temp.rounded())"
//                                            self.weatherIcon.image = UIImage(named: "\(currentWeather.weather[0].icon)")
//                                        }
                }
                catch{
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
    
    func forecastWeather() {
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
                    
                    //                    DispatchQueue.main.async {
                    //                        self.tableView.reloadData()
                    //                    }
                }
                catch{
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
}


class AlamofireWeatherService: WeatherService{
    var forcastWeatherDataArray = [List]()
    func currentWeather() {
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?q=moscow&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: WeatherData.self) { (response) in
            guard let currentWeather = response.value else { return }
//            DispatchQueue.main.async {
//                self.cityNameLabel.text = "\(currentWeather.name)"
//                self.weatherDescriptionLabel.text = "\(currentWeather.weather[0].description)"
//                self.tempLabel.text = "\(currentWeather.main.temp.rounded())"
//                self.iconImageView.image = UIImage(named: "\(currentWeather.weather[0].icon)")
//            }
        }
    }
    
    func forecastWeather() {
        let request = AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&&cnt=16&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: ForecastWeatherData.self) { (response) in
            guard let forecastWeather = response.value else { return }
            self.forcastWeatherDataArray = forecastWeather.list
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
        }
    }
    
    
}



