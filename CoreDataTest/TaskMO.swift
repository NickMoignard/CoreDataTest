//
//  TaskMO.swift
//  CoreDataTest
//
//  Created by Alice Newman on 4/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//


import CoreData

class TaskMO: NSManagedObject {
        @NSManaged private var complete: NSNumber
        @NSManaged var title: String?
        
        var completed: Bool {
            get {
                return Bool(complete)
            }
            set {
                complete = NSNumber(booleanLiteral: newValue)
            }
        }
    
}
