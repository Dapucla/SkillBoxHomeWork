//
//  ViewController.swift
//  gallery
//
//  Created by Даниил Алексеев on 03.06.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var backOutlet: UIButton!
    
    @IBOutlet var nextOutlet: UIButton!
    
    var imageInt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String("\(imageInt)/10")
        imageInt = 1
        backOutlet.isEnabled = false
        nextOutlet.isEnabled = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        imageInt -= 1
        imageView.image = UIImage(named: "image\(imageInt).jpeg")
        label.text = String("\(imageInt)/10")
        moveCheck()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        imageInt += 1
        imageView.image = UIImage(named: "image\(imageInt).jpeg")
        label.text = String("\(imageInt)/10")
        moveCheck()
    }
    
    func moveCheck() {
         backOutlet.isEnabled = imageInt > 1
        nextOutlet.isEnabled = imageInt < 10
        }
    }
}

