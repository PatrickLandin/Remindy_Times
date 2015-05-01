//
//  TaskListTableViewController.swift
//  Remindy_Times
//
//  Created by Patrick Landin on 4/30/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
  
  var tasks = [TaskListItem]()
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    

    let rowItem0 = TaskListItem()
    rowItem0.text = "Walk the dog"
    rowItem0.checked = false
    tasks.append(rowItem0)
    
    let rowItem1 = TaskListItem()
    rowItem1.text = "Brush my teeth"
    rowItem1.checked = true
    tasks.append(rowItem1)
    
    let rowItem2 = TaskListItem()
    rowItem2.text = "Learn iOS development"
    rowItem2.checked = true
    tasks.append(rowItem2)
    
    let rowItem3 = TaskListItem()
    rowItem3.text = "Soccer practice"
    rowItem3.checked = false
    tasks.append(rowItem3)
    
   let rowItem4 = TaskListItem()
    rowItem4.text = "Whatever"
    rowItem4.checked = false
    tasks.append(rowItem4)
    
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.rowHeight = 44
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureCheckmarkForCell(cell : UITableViewCell, withTaskListItem task : TaskListItem) {
 
      if task.checked {
        cell.accessoryType = .Checkmark
      } else {
        cell.accessoryType = .None
      }
    
    }

    // MARK: Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }

   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TASK_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    let task = tasks[indexPath.row]
    let label = cell.viewWithTag(29) as! UILabel
    label.text = task.text
  
    configureCheckmarkForCell(cell, withTaskListItem: task)
    
    return cell
  }

  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
    
      let task = tasks[indexPath.row]
      task.checked = !task.checked
      configureCheckmarkForCell(cell, withTaskListItem: task)
      
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
}
