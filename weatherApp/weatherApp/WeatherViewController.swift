//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 25.11.2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherService: WeatherService?
    let window: UIWindow? = nil
    let tabBar = UITabBarController()
    let AlamofireWeather = UIViewController()
    let URLSessionWeather = UIViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab()
        URLSession()

    }
    
    
    func URLSession() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 0, y: 100)
        label.textAlignment = .center
        label.center.x = self.view.center.x
        label.text = sender.cityNamelabel
        
        
        self.URLSessionWeather.view.addSubview(label)
    }
    
    
    func tab(){
        URLSessionWeather.view.backgroundColor = .green
        AlamofireWeather.view.backgroundColor = .yellow
        
        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let item2 = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        URLSessionWeather.tabBarItem = item1
        AlamofireWeather.tabBarItem = item2
        
        tabBar.viewControllers = [URLSessionWeather, AlamofireWeather]
        self.view.addSubview(tabBar.view)
    }
    
    
    
    
}
