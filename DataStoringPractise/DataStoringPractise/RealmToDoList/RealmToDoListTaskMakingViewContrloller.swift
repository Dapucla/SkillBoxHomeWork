//
//  RealmToDoListTaskMakingViewContrloller.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//
import RealmSwift
import UIKit

class RealmToDoListTaskMakingViewContrloller: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDescriptionTextField.becomeFirstResponder()
        taskDescriptionTextField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(save))
        taskDatePicker.setDate(Date(), animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskDescriptionTextField.resignFirstResponder()
        return true
    }
    
    @objc func save(){
        if let text = taskDescriptionTextField.text, !text.isEmpty{
            let date = taskDatePicker.date
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
