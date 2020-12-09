//
//  RealmWeatherDataModel.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//

import RealmSwift
import Foundation

class RealmCurrentWeatherData: Object{
    @objc dynamic var currentWeatherTemp: String = ""
    @objc dynamic var currentWeatherDescription: String = ""
    @objc dynamic var cityName: String = ""
    @objc dynamic var currentWeatherIcon: String = ""
}
