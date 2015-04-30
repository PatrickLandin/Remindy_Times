//
//  TaskListTableViewController.swift
//  Remindy_Times
//
//  Created by Patrick Landin on 4/30/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    return cell
  }

  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      if cell.accessoryType == .None {
        cell.accessoryType = .Checkmark
      } else {
        cell.accessoryType = .None
      }
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

}
