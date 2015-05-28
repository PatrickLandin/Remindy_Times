//
//  AddTaskTableViewController.swift
//  Remindy_Times
//
//  Created by Patrick Landin on 5/8/15.
//  Copyright (c) 2015 pLandin. All rights reserved.
//

import UIKit

protocol AddTaskTableViewControllerDelegate : class {
  func addTaskTableViewControllerDidCancel(controller: AddTaskTableViewController)
  func addTaskTableViewController(controller: AddTaskTableViewController, didFinishAddingTask task: TaskListItem)
}

class AddTaskTableViewController: UITableViewController, UITextFieldDelegate {

  @IBOutlet weak var addTaskTextField: UITextField!
  @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
  
  weak var delegate : AddTaskTableViewControllerDelegate?
  
  required init!(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    addTaskTextField.becomeFirstResponder()
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
    self.navigationItem.title = "Add Task"
    self.addTaskTextField.delegate = self

  } // viewDidLoad

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  @IBAction func doneButtonPressed(sender: AnyObject) {
    
    println("add task text: \(addTaskTextField.text)")
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    let oldText : NSString = textField.text
    let newText : NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
    
    self.doneBarButtonItem.enabled = newText.length > 0
    
    return true
  }
  
  
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }

}