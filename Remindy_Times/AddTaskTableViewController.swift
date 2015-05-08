//
//  AddTaskTableViewController.swift
//  Remindy_Times
//
//  Created by Patrick Landin on 5/8/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

class AddTaskTableViewController: UITableViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
      
    self.navigationItem.title = "Add Item"

  } // viewDidLoad

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }

}