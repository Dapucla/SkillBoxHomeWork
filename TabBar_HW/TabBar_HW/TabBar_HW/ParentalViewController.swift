//
//  ParentalViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 03.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit



class ParentalViewController: UIViewController {
   
    private var ContVC: childViewController?
    
    
    @IBAction func greenChildBackgroundColor(_ sender: Any) {
         ContVC?.colorView = .green
    }
    
    @IBAction func yellowChildBackgroundColor(_ sender: Any){
        ContVC?.colorView = .yellow
    }
    
    @IBAction func purpleChildBackgroundColor(_ sender: Any) {
        ContVC?.colorView = .purple
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? childViewController, segue.identifier == "BackgroundChanger"{
            ContVC = vc
            vc.delegate = self

        }
    }
    
}
extension ParentalViewController: ChildViewControllerDelegate{
    func setColor(_ color: UIColor) {
       view.backgroundColor = color
    }
    
    
}