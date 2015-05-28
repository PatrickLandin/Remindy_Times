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
    rowItem0.text = "Practice the codey times"
    rowItem0.checked = false
    tasks.append(rowItem0)
    
    let rowItem1 = TaskListItem()
    rowItem1.text = "Roll out my calves and knee"
    rowItem1.checked = false
    tasks.append(rowItem1)
    
    let rowItem2 = TaskListItem()
    rowItem2.text = "Go for a run"
    rowItem2.checked = false
    tasks.append(rowItem2)
    
    let rowItem3 = TaskListItem()
    rowItem3.text = "Get married"
    rowItem3.checked = true
    tasks.append(rowItem3)
    
    let rowItem4 = TaskListItem()
    rowItem4.text = "Buy shirts, ties, and socks"
    rowItem4.checked = true
    tasks.append(rowItem4)
    
  }

  override func viewDidLoad() {
      super.viewDidLoad()
    
    self.navigationItem.title = "Task List"
    self.tableView.rowHeight = 44
    
  } // viewDidLoad

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
    
  @IBAction func addTaskPressed(sender: UIBarButtonItem) {
    
    let newRowIndex = tasks.count
    
    let task = TaskListItem()
    task.checked = false
    task.text = "New tasky thing"
    tasks.append(task)
    
    let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
    let indexPaths = [indexPath]
    tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    
  }
  
  func configureCheckmarkForCell(cell: UITableViewCell, withTaskListItem task: TaskListItem) {
 
    if task.checked {
        cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  
  func configureTextForCell(cell: UITableViewCell, withTaskListItem task: TaskListItem) {
    let label = cell.viewWithTag(29) as! UILabel
    label.text = task.text
  }

  // MARK: Table view data source

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.tasks.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TASK_CELL", forIndexPath: indexPath) as! UITableViewCell
    let task = tasks[indexPath.row]
    configureTextForCell(cell, withTaskListItem: task)
    configureCheckmarkForCell(cell, withTaskListItem: task)
    
    return cell
  }

  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      let task = tasks[indexPath.row]
      task.toggleChecked()
      
      configureCheckmarkForCell(cell, withTaskListItem: task)
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    tasks.removeAtIndex(indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
}
