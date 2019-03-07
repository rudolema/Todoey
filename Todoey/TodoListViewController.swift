//
//  ViewController.swift
//  Todoey
//
//  Created by Joel Clott on 3/7/19.
//  Copyright © 2019 Joel Clott. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
  
  let itemsArray = ["Eat a chocolate ant.","Swim a mile.","Smell a tulip."]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
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
}

