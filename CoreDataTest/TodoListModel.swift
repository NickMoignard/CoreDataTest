//
//  TodoListModel.swift
//  CoreDataTest
//
//  Created by Alice Newman on 4/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TodoListModel {
    
    var context: NSManagedObjectContext
    
    
    
    init() {
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // Save
    public func saveTodo(completed: Bool, title: String, completionHandler: (_ textFieldString: String) -> Void){
        
        // Create new managed object
        if let newTask = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as? TaskMO {
            newTask.completed = completed
            newTask.title = title
            
            // Save managed object
            saveHelper()
            completionHandler(title)
        }
    }
    
    
    private func saveHelper() {
        do {
            try self.context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    // Update
    
    // Fetch
    public func fetchTodos() -> [TaskMO] {
        let todosFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        var revTodos: [TaskMO] = []
        do {
            let todos = try context.fetch(todosFetch) as! [TaskMO]
            
            for i in 0..<todos.count {
                revTodos.append(todos[todos.count - i - 1])
            }
            
            
            return revTodos
            
        } catch {
            fatalError("Todo fetch request failed: \(error)")
        }
        return revTodos
    }
    
    
    // Delete
    public func deleteTask( task: TaskMO, completionHandler:() -> Void) {
        context.delete(task)
        saveHelper()
        completionHandler()
    }
    
    
    
    
    
}
//
//@IBAction func buttonTapped(_ sender: UIButton) {
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let task = Task(context: context) // Link Task & Context
//    task.name = taskTextField.text!
//    
//    // Save the data to coredata
//    (UIApplication.shared.delegate as! AppDelegate).saveContext()
//    
//    let _ = navigationController?.popViewController(animated: true)
