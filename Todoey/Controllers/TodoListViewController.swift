//
//  ViewController.swift
//  Todoey
//
//  Created by Joel Clott on 3/7/19.
//  Copyright © 2019 Joel Clott. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
  
  var itemsArray = [Item]()
//  var itemsArray = ["Eat a chocolate ant.","Swim a mile.","Smell a tulip."]
  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let newItem1 = Item()
    newItem1.title = "Eat a chocolate ant."
    itemsArray.append(newItem1)
    
    let newItem2 = Item()
    newItem2.title = "Swim a mile."
    itemsArray.append(newItem2)
    
    let newItem3 = Item()
    newItem3.title = "Smell a tulip."
    itemsArray.append(newItem3)
    
    if let items = defaults.array(forKey: "toDoListArray") as? [Item] {
      itemsArray = items
    }
  }
  //MARK:- Tableview datasource methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return itemsArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
    
    let item = itemsArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    // a ternary operation
    // value = condition ? valueIfTrue : valueIfFalse
    
    cell.accessoryType = item.done ? .checkmark : .none
    
    return cell
  }
  //MARK:- Tableview delegate methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print(itemsArray[indexPath.row])
    
    itemsArray[indexPath.row].done = !itemsArray[indexPath.row].done
    tableView.reloadData()
    
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
      let newItem = Item()
      newItem.title = textField.text!
      self.itemsArray.append(newItem)
      
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

