//
//  childViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 03.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

protocol ChildViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class childViewController: UIViewController {
    
    var delegate: ChildViewControllerDelegate?
    
    var colorView: UIColor?{
        didSet{ view.backgroundColor = colorView}
    }
    
      override func viewDidLoad() {
        super.viewDidLoad()
     }
    

    
    @IBAction func greenColorParent() {
         delegate?.setColor(.green)
    }
    
    @IBAction func yellowColorParent() {
         delegate?.setColor(.yellow)
    }
    
    
    @IBAction func purpleColorParent() {
        delegate?.setColor(.purple)
    }
    
}
    
