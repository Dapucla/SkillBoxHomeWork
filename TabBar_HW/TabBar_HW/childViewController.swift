//
//  childViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 03.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit



class childViewController: UIViewController {

    var color = UIColor() {
        didSet{
            view.backgroundColor = color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = color
    }
    
}

