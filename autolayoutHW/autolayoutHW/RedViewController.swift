//
//  RedViewController.swift
//  autolayoutHW
//
//  Created by Даниил Алексеев on 12.10.2020.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func textButton(_ sender: Any) {
        
        if label.numberOfLines < 6{
//      height.constant += 10
            label.numberOfLines += 1
            view.layoutIfNeeded()
        }

        if label.numberOfLines == 6 {
// height.constant = 150
        label.numberOfLines = 1
        }
    }
    
}
