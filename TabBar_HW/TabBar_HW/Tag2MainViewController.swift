//
//  Tag2MainViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 02.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

class Tag2MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var mainLabelText: UILabel!
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Tag2MenuViewController, segue.identifier == "ShowMenu"{
            vc.colorText = mainLabelText.text ?? "mistake"
            vc.delegate = self
        }
    }
}

extension Tag2MainViewController: Tag2MenuViewControllerDelegate{
    func setLabel(_ labelText: String) {
        mainLabelText.text = labelText
    }
}
