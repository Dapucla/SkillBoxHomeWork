//
//  ViewController.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UserDefaultsDataModel.shared.userName
        surnameLabel.text = UserDefaultsDataModel.shared.userSurname
        print(UserDefaultsDataModel.shared.userName as Any)
        print(UserDefaultsDataModel.shared.userSurname as Any)
    }
    
    @IBAction func saveUserDefaultsDataButton() {
        UserDefaultsDataModel.shared.userName = nameTextField.text
        UserDefaultsDataModel.shared.userSurname = surnameTextField.text
        nameLabel.text = UserDefaultsDataModel.shared.userName
        surnameLabel.text = UserDefaultsDataModel.shared.userSurname
    }
}

