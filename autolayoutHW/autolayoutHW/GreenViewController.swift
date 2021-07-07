//
//  GreenViewController.swift
//  autolayoutHW
//
//  Created by Даниил Алексеев on 05.10.2020.
//

import UIKit

class GreenViewController: UIViewController {
    
    


    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    

    var state = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
    }
    
    
    @IBAction func textButton(_ sender: Any) {
        
        if label.numberOfLines < 6{
//            height.constant += 10
            label.numberOfLines += 1
            view.layoutIfNeeded()
        }
        
        if label.numberOfLines == 6 {
            
//                height.constant = 150
            
            
            label.numberOfLines = 1
        }
        
    }
}














//        if state == true{
//            label.numberOfLines = 5
//           state = false
//           label.isHidden = state
//        }
//        else {
//            label.numberOfLines = 0
//            state = true
//            label.isHidden = state
//        }
