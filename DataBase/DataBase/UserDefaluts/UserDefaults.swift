//
//  UserDefaults.swift
//  DataBase
//
//  Created by Даниил Алексеев on 10.11.2020.
//

import Foundation

class LoginUserDefaultsStorage {
    static let shared = LoginUserDefaultsStorage()
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
