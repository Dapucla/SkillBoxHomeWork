//
//  Tag2MenuViewController.swift
//  TabBar_HW
//
//  Created by Даниил Алексеев on 02.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

protocol Tag2MenuViewControllerDelegate {
    func setLabel(_ labelText: String )
    
}
class Tag2MenuViewController: UIViewController {
  var colorText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenColorLabel.text! = colorText
    }
    
  
    
    var colorButton = ""
    var delegate: Tag2MenuViewControllerDelegate?
    @IBOutlet weak var chosenColorLabel: UILabel!
    
    @IBAction func greenColor(_ sender: Any) {
        chosenColorLabel.text! = "Выбран Зеленый"
        colorButton = "Выбран Зеленый"
        delegate?.setLabel(colorButton)
        dismiss(animated: true)
     
    }
    
    @IBAction func blueColor(_ sender: Any) {
        chosenColorLabel.text! = "Выбран Синий"
        colorButton = "Выбран Синий"
        delegate?.setLabel(colorButton)
        dismiss(animated: true)
    }
    
    @IBAction func redColor(_ sender: Any) {
        chosenColorLabel.text! = "Выбран Красный"
        colorButton = "Выбран Красный"
        delegate?.setLabel(colorButton)
        dismiss(animated: true)
    }

    
}
