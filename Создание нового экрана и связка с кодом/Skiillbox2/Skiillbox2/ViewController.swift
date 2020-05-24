//
//  ViewController.swift
//  Skiillbox2
//
//  Created by Даниил Алексеев on 02.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finalName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var nametextField: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GreenViewController, segue.identifier == "showGreen"{
            vc.userName = nametextField.text!
            vc.delegate = self
        }
    }
}

extension ViewController: GreenControllerDelegate{
    func setRole(_ role: String){
        finalName.text! = "\(nametextField.text!), \(role)"
    }
}
