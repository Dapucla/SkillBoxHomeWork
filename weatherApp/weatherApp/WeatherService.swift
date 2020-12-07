//
//  WeatherService.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 25.11.2020.
//
//
//  WeatherService.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 25.11.2020.
//

import Foundation
import Alamofire

protocol WeatherService {
    func currentWeather(completion: @escaping (WeatherData) -> Void)
    func forecastWeather(completion: @escaping (ForecastWeatherData) -> Void)
}

class URLSessionWeatherService: WeatherService{
    
    var forcastWeatherDataArray = [List]()
    var cityNamelabel: String = ""

    func currentWeather(completion: @escaping (WeatherData) -> Void) {
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
                    DispatchQueue.main.async {
                        completion(currentWeather)
                    }
                }
                catch{
                    print("Error in JSON parsing")
                }
            }
        }
        dataTask.resume()
    }
    
    func forecastWeather(completion: @escaping (ForecastWeatherData) -> Void) {
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
                        completion(forecastWeather)
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


class AlamofireWeatherService: WeatherService{
    var forcastWeatherDataArray = [List]()
    
    func currentWeather(completion: @escaping (WeatherData) -> Void) {
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?q=moscow&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: WeatherData.self) { (response) in
            guard response.value != nil else { return }
            DispatchQueue.main.async {
                completion(response.value!)
            }
        }
    }
    
    func forecastWeather(completion: @escaping (ForecastWeatherData) -> Void) {
        let request = AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&&cnt=16&appid=3c757e21945992f453e5956c109eb529&lang=ru&units=metric")
        request.responseDecodable(of: ForecastWeatherData.self) { (response) in
            guard let forecastWeather = response.value else { return }
            self.forcastWeatherDataArray = forecastWeather.list
            DispatchQueue.main.async {
                completion(forecastWeather)

            }
        }
    }
}

