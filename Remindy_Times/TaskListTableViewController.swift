//
//  TaskListTableViewController.swift
//  Remindy_Times
//
//  Created by Patrick Landin on 4/30/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
  
  var rowItem0 : TaskListItem
  var rowItem1 : TaskListItem
  var rowItem2 : TaskListItem
  var rowItem3 : TaskListItem
  var rowItem4 : TaskListItem
  
  var tasks : [TaskListItem]
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    rowItem0 = TaskListItem()
    rowItem0.text = "Walk the dog"
    rowItem0.checked = false
    tasks.append(rowItem0)
    
    rowItem1 = TaskListItem()
    rowItem1.text = "Brush my teeth"
    rowItem1.checked = true
    tasks.append(rowItem1)
    
    rowItem2 = TaskListItem()
    rowItem2.text = "Learn iOS development"
    rowItem2.checked = true
    tasks.append(rowItem2)
    
    rowItem3 = TaskListItem()
    rowItem3.text = "Soccer practice"
    rowItem3.checked = false
    tasks.append(rowItem3)
    
    rowItem4 = TaskListItem()
    rowItem4.text = "Whatever"
    rowItem4.checked = true
    tasks.append(rowItem4)

    override func viewDidLoad() {
        super.viewDidLoad()

    }

     func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func configureCheckmarkForCell(cell : UITableViewCell, indexPath : NSIndexPath) {
    
    var isChecked = false
    
    if indexPath.row == 0 {
      isChecked = rowItem0.checked
    } else if indexPath.row == 1 {
      isChecked = rowItem1.checked
    } else if indexPath.row == 2 {
      isChecked = rowItem2.checked
    } else if indexPath.row == 3 {
      isChecked = rowItem3.checked
    } else if indexPath.row == 4 {
      isChecked = rowItem4.checked
    }
    
    if isChecked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
    
  }

    // MARK: Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TASK_CELL", forIndexPath: indexPath) as! UITableViewCell
    
    let label = cell.viewWithTag(29) as! UILabel
    
    if indexPath.row == 0 {
      label.text = rowItem0.text
    } else if indexPath.row == 1 {
      label.text = rowItem1.text
    } else if indexPath.row == 2 {
      label.text = rowItem2.text
    } else if indexPath.row == 3 {
      label.text = rowItem3.text
    } else if indexPath.row == 4 {
      label.text = rowItem4.text
    }
    
    configureCheckmarkForCell(cell, indexPath: indexPath)
    
    return cell
  }

  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      if indexPath.row == 0 {
        rowItem0.checked = !rowItem0.checked
      } else if indexPath.row == 1 {
        rowItem1.checked = !rowItem1.checked
      } else if indexPath.row == 2 {
        rowItem1.checked = !rowItem2.checked
      } else if indexPath.row == 3 {
        rowItem1.checked = !rowItem3.checked
      } else if indexPath.row == 4 {
        rowItem1.checked = !rowItem4.checked
    }
    
      configureCheckmarkForCell(cell, indexPath: indexPath)
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      
    }
  }
  
}
