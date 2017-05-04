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

class TodoListViewController: UITableViewController {
    let todoListModel = TodoListModel()
    let testData = [(false, "hello"), (false, "hello"), (false, "hello")]
    var todoData: [TodoManagedObject]? = nil
 
    // Outlets
    @IBOutlet var todoListView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoListView.delegate = self
        todoListView.dataSource = self
        
        // Save test data
        for data in testData {
            todoListModel.saveTodo(completed: data.0, title: data.1)
        }
        
        // Fetch todos and populate controller data member
        todoData = todoListModel.fetchTodos()
    }
    
    // TableView Data Source Methods
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int    {
        return todoData!.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if let todoText = todoData![indexPath.row].title {
            cell.textLabel?.text = todoText
        } else {
            cell.textLabel?.text = "title attribute was nil"
        }
        
        return cell
    }
    
    // Actions
    
    
    
}
