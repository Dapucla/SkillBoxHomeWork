//
//  UITabBarViewController.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 29.11.2020.
//

import UIKit

class UITabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
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
    
    var tabbar = UITabBarController()
    func createtabbar() -> UITabBarController {
       
        UITabBar.appearance().tintColor = .systemPink
        tabbar.viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
        return tabbar
    }
    
//    var tabBar:
    
    
    init(tabbar: UITabBarController) {
        self.tabbar = tabbar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    


}
