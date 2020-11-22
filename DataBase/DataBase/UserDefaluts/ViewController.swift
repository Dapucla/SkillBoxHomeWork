//
//  ViewController.swift
//  DataBase
//
//  Created by Даниил Алексеев on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var resultSurnameLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultNameLabel.text = LoginUserDefaultsStorage.shared.userName
        resultSurnameLabel.text = LoginUserDefaultsStorage.shared.userSurname
        print(LoginUserDefaultsStorage.shared.userName as Any)
        print(LoginUserDefaultsStorage.shared.userSurname as Any)
    }

    @IBAction func saveButton() {
        LoginUserDefaultsStorage.shared.userName = nameTextField.text
        LoginUserDefaultsStorage.shared.userSurname = surnameTextField.text
        resultNameLabel.text = LoginUserDefaultsStorage.shared.userName
        resultSurnameLabel.text = LoginUserDefaultsStorage.shared.userSurname
    }
    
}

