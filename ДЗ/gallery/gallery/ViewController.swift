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
    
    var imageInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageInt = 1
        label.text = String("\(imageInt)/10")
        
        backOutlet.isEnabled = false
    
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        imageInt -= 1
        label.text = String("\(imageInt)/10")
        
        self.imageGallery()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        imageInt += 1
        label.text = String("\(imageInt)/10")
        
        self.imageGallery()
    }
    
    func imageGallery(){
        
        
        
        if imageInt == 1 {
            backOutlet.isEnabled = false
            imageView.image = UIImage(named: "image\(imageInt).jpeg")
        }
        if imageInt == 2 {
            backOutlet.isEnabled = true
            imageView.image = UIImage(named: "image\(imageInt).jpeg")
        }
       if imageInt == 3 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
       if imageInt == 4 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
       if imageInt == 5 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
       if imageInt == 6 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
       if imageInt == 7 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
       if imageInt == 8 {
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
       }
        if imageInt == 9 {
            
            nextOutlet.isEnabled = true
            imageView.image = UIImage(named: "image\(imageInt).jpeg")
        }
        if imageInt == 10 {
            
            nextOutlet.isEnabled = false
           imageView.image = UIImage(named: "image\(imageInt).jpeg")
            
        }
    }
    
}

