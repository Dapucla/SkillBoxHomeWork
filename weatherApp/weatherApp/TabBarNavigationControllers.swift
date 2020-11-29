//
//  TabBarNavigationControllers.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 29.11.2020.
//

import Foundation


func createSearchNavigationController() -> UINavigationController {
    let sessionVC = WeatherViewController()
    sessionVC.title = "Session"
    sessionVC .tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    return UINavigationController(rootViewController: sessionVC)
}

func createFavoritesNavigationController() -> UINavigationController {
    let alamofireVC = WeatherViewController()
    alamofireVC.title = "Alamofire"
    alamofireVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    return UINavigationController(rootViewController: alamofireVC)
}


func createtabbar() -> UITabBarController {
    let tabbar = UITabBarController()
    UITabBar.appearance().tintColor = .systemPink
    tabbar.viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    return tabbar
}
