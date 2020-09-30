//
//  ViewController.swift
//  Segmented views
//
//  Created by Wissa Azmy on 7/8/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdView.alpha = 0
    }

    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
        } else if sender.selectedSegmentIndex == 1  {
            thirdView.alpha = 0
            firstView.alpha = 0
            secondView.alpha = 1
        } else{
            thirdView.alpha = 1
            firstView.alpha = 0
            secondView.alpha = 0
        }
    }

}

