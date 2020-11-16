//
//  WeatherDataModel.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 07.11.2020.
//

import Foundation

struct WeatherConditions: Codable{
    var temp: Double
    var feels_like: Double
    var pressure: Double
}

struct Weather: Codable {
    let id: Double
    let main: String
    let description: String
    let icon: String
}
struct WeatherData: Codable {
    let weather: [Weather]
    let main: WeatherConditions
    let name: String
}
