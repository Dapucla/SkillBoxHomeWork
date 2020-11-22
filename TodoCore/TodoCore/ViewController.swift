//
//  ViewController.swift
//  TodoCore
//
//  Created by Даниил Алексеев on 15.11.2020.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    var items = [Items]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = item.completion ? .checkmark : .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.row].completion = !items[indexPath.row].completion
        saveItems()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            let item = items[indexPath.row]
            items.remove(at: indexPath.row)
            context.delete(item)
            
            do {
                try context.save()
            } catch{
                print("Error deleting")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Добавить Задание", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            let newItem = Items(context: self.context)
            newItem.name = textField.text
            newItem.completion = false
            self.items.append(newItem)
            self.saveItems()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Добавьте задание"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func saveItems(){
        
        do {
            try context.save()
        }catch{
            print("saving error \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    
    func loadItems(){
        let request: NSFetchRequest<Items> = Items.fetchRequest()

        do{
            items = try context.fetch(request)
        }catch{
            print("error fetching")
        }
        self.tableView.reloadData()

    }
    
}
