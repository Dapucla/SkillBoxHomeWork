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
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
      override func viewDidLoad() {
        super.viewDidLoad()
     }
    @IBAction func greenParentBackgroundColor(_ sender: Any) {
        delegate?.setColor(.green)
    }
    @IBAction func yellowParentBackgroundColor(_ sender: Any) {
          delegate?.setColor(.yellow)
    }
    @IBAction func purpleParentBackgroundColor(_ sender: Any) {
        delegate?.setColor(.purple)
    }
    
}
    
