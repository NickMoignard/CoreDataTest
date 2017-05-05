//
//  TodoListViewController.swift
//  CoreDataTest
//
//  Created by Alice Newman on 4/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let todoListModel = TodoListModel()
    var taskData: [TaskMO]? = nil
 
    // Outlets
    @IBOutlet var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set up custom table view cells
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "comment")
        
        // Fetch todos and populate controller data member
        resetData()
    }
    
    // TableView Data Source Methods
    public  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int    {
        return taskData!.count
    }
    
    public  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a table view cell then update the Outlets within the cell
        let cell:CommentTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "comment") as! CommentTableViewCell
        
        
        if let todoText = taskData![indexPath.row].title {
            cell.commentBody?.text = todoText
        } else {
            cell.textLabel?.text = "title attribute was nil"
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Implement popularity to size of comment font logic here
        return 80
    }
    
    // Actions
    @IBAction func newComment(_ sender: Any) {
        // Create Alert
        let alert = UIAlertController(title: "New Comment", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel ) {
            (_) in
            alert.dismiss(animated: true, completion: nil)
        })
        
        // Add text field to alert
        alert.addTextField() {
            (textField) in
            textField.text = ""
        }
        
        // Grab the string from UITextField
        alert.addAction(UIAlertAction(title: "Add", style: .default) {
            (_) in
            
            // Dangerous line of code. Not sure how to handle
            let taskTitle = alert.textFields![0].text!
            
            if (taskTitle != "") {
                self.todoListModel.saveTodo(completed: false, title: taskTitle) {
                    (_) in
                    self.resetData()
                }
            } else {
                alert.dismiss(animated: true, completion: nil)
            }
        })
        self.present(alert, animated: true, completion: nil)
    }

    // Deleted a Task
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            // remove item from db
            todoListModel.deleteTask(task: self.taskData![indexPath.row]) {
                () in
                self.resetData()
            }
            
            

        }
    }
    
    // Helper Methods
    private func resetData() {
        taskData = todoListModel.fetchTodos()
        tableView.reloadData()
    }
    
    
    
}
