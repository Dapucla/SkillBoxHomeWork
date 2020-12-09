//
//  ForecastweatherDataModel.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 08.11.2020.
//

import Foundation

class ForecastWeatherData: Codable{
    let list: [List]
    init(list: [List]) {
        self.list = list
    }
}

class ForecastMain: Codable {
    let temp: Float
    init(temp: Float){
        self.temp = temp
    }
}

class ForecastWeather: Codable{
    let icon: String
    init(icon: String){
        self.icon = icon
    }
}
 
class List: Codable {
    let main: ForecastMain
    let weather: [ForecastWeather]
    let dt_txt: String
    init(main: ForecastMain, weather: [ForecastWeather], dt_txt:String){
        self.main = main
        self.weather = weather
        self.dt_txt = dt_txt
    }
}
