//
//  UserDefaultsDataModel.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//

import Foundation

class UserDefaultsDataModel {
    static let shared = UserDefaultsDataModel()
    private let kUserNameKey = "LoginUserDefaultsStorage.kUserNameKey"
    private let kUserSurnameKey = "LoginUserDefaultsStorage.kUserSurnameKey"
    
    var userName: String? {
        set {UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get {return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    
    var userSurname: String? {
        set {UserDefaults.standard.set(newValue, forKey: kUserSurnameKey)}
        get {return UserDefaults.standard.string(forKey: kUserSurnameKey)}
    }
    
}
