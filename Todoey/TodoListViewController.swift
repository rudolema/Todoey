//
//  ViewController.swift
//  Todoey
//
//  Created by Joel Clott on 3/7/19.
//  Copyright © 2019 Joel Clott. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
  
  var itemsArray = ["Eat a chocolate ant.","Swim a mile.","Smell a tulip."]
  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let items = defaults.array(forKey: "toDoListArray") as? [String] {
        itemsArray = items
      }
  }
  //MARK:- Tableview datasource methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return itemsArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
    
    cell.textLabel?.text = itemsArray[indexPath.row]
    
    return cell
  }
  //MARK:- Tableview delegate methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(itemsArray[indexPath.row])
    
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    print(indexPath.row)
  }
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add New Todoey Items", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "Add Item", style: .default)
    { (alert) in
     //what will happen when user clicks alert
      self.itemsArray.append(textField.text!)
      self.defaults.set(self.itemsArray, forKey: "toDoListArray")
      self.tableView.reloadData()
    }
    alert.addTextField { (alertTextfield) in
      alertTextfield.placeholder = "Create a Todo item"
      textField = alertTextfield
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
}

