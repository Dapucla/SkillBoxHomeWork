//
//  TaskMakerViewController.swift
//  DataBase
//
//  Created by Даниил Алексеев on 11.11.2020.
//
import RealmSwift
import UIKit

class TaskMakerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        textField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(save))
        
        datePicker.setDate(Date(), animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func save(){
        if let text = textField.text, !text.isEmpty{
            let date = datePicker.date
            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }else {
            print("add something")
        }
    }
}

