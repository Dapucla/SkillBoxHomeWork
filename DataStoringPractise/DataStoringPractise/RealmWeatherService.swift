//
//  RealmWeatherService.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 10.12.2020.
//

import Foundation
import Alamofire

protocol WeatherService {
    func currentWeather(completion: @escaping (WeatherData) -> Void)
    func forecastWeather(completion: @escaping (ForecastWeatherData) -> Void)
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
