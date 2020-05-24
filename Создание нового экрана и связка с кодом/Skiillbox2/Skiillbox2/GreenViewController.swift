//
//  GreenViewController.swift
//  Skiillbox2
//
//  Created by Даниил Алексеев on 02.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

protocol GreenControllerDelegate{
    func setRole(_ role: String)
}

class GreenViewController: UIViewController {

    @IBOutlet weak var RoleTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    var userName = ""
    var delegate: GreenControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName

        // Do any additional setup after loading the view.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        delegate?.setRole(RoleTextField.text!)
    }
    


}
