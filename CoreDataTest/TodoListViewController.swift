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
//    let testData = [(false, "hello"), (false, "hello"), (false, "hello")]
    var taskData: [TaskMO]? = nil
 
    // Outlets
    @IBOutlet var todoListView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoListView.delegate = self
        todoListView.dataSource = self
        
        // Fetch todos and populate controller data member
        taskData = todoListModel.fetchTodos()
    }
    
    // TableView Data Source Methods
    public  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int    {
        return taskData!.count
    }
    
    public  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if let todoText = taskData![indexPath.row].title {
            cell.textLabel?.text = todoText
        } else {
            cell.textLabel?.text = "title attribute was nil"
        }
    
        return cell
    }
    
    // Actions
    @IBAction func newTask(_ sender: Any) {
        print("clicky clicky")
        
        // Create Alert
        let alert = UIAlertController(title: "New Task", message: "", preferredStyle: .alert)
        
        // Add text field to alert
        alert.addTextField() {
            (textField) in
            textField.text = ""
        }
        
        // Grab the string from UITextField
        alert.addAction(UIAlertAction(title: "Ok", style: .default) {
            (_) in
            
            // Dangerous line of code. Not sure how to handle
            let taskTitle = alert.textFields![0].text!
            self.todoListModel.saveTodo(completed: false, title: taskTitle) {
                (_) in
                self.todoListView.reloadData()
            }
            
            
            
                
        })
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    
}
