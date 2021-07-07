//
//  ParentalViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 03.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit




class ParentalViewController: UIViewController {
   
    private var colorVC: childViewController?
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? childViewController, segue.identifier == "BackgroundChanger"{
           colorVC = vc
        }
    }

//    @IBAction func yellowChildColor(_ sender: UIButton) {
//        // Editing changed кнопка
//        colorVC?.color = UIColor.yellow
//    }
    
    @IBAction func yellowColor(_ sender: UIButton) {
        // Touch up inside унопка
        colorVC?.color = UIColor.yellow
    }
    
}
