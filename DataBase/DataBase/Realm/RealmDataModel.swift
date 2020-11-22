//
//  RealmDataModel.swift
//  DataBase
//
//  Created by Даниил Алексеев on 11.11.2020.
//

import RealmSwift
import Foundation

class ToDoListItem: Object{
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class realmWeatherData: Object{
    @objc dynamic var currentWeatherTemp: String = ""
    @objc dynamic var currentWeatherDescription: String = ""
    @objc dynamic var cityName: String = ""
    @objc dynamic var currentWeatherIcon: String = ""
}

class realmForecastData: Object{
    @objc dynamic var forecastWeatherTemp: String = ""
    @objc dynamic var forecastDate: String = ""
    @objc dynamic var forecastWeatherIcon: String = ""
}
                         


