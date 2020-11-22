//
//  ToDoListRealmViewController.swift
//  DataBase
//
//  Created by Даниил Алексеев on 11.11.2020.
//
import RealmSwift
import UIKit

class ToDoListRealmViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let realm = try! Realm()
    private var data = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(ToDoListItem.self).map({$0})
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "taskManager") as? TaskMakerViewController else {
            return
        }
        vc.completionHandler = { [weak self] in
            self?.refresh()
        }
        vc.title = "Добавим Задание"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func refresh(){
        data = realm.objects(ToDoListItem.self).map({$0})
        tableView.reloadData()
    }
    
}

extension ToDoListRealmViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RealmTableViewCell
        cell.taskName.text = data[indexPath.row].item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "Delete") as? CompletedTaskViewController else {
            return
        }
        vc.item = item
        vc.deletionHandler = { [weak self] in
            self?.refresh()
        }
        vc.title = item.item
        navigationController?.pushViewController(vc, animated: true)
    }
}
