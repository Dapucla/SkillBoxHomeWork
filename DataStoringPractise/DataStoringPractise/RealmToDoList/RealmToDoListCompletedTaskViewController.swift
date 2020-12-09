//
//  RealmToDoListCompletedTaskViewController.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//
import RealmSwift
import UIKit

class RealmToDoListCompletedTaskViewController: UIViewController {
    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?
    @IBOutlet weak var taskCompletionDataLabel: UILabel!
    private let realm = try! Realm()
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        taskCompletionDataLabel.text = Self.dateFormatter.string(from: item!.date)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }
    @objc private func didTapDelete() {
        guard let myItem = self.item else {
            return
        }
        realm.beginWrite()
        realm.delete(myItem)
        try! realm.commitWrite()
        deletionHandler?()
        navigationController?.popToRootViewController(animated: true)
    }
}
