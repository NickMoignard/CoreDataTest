//
//  UserMO.swift
//  CoreDataTest
//
//  Created by Alice Newman on 5/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import CoreData

class UserMO: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var id: Double
    @NSManaged var comment: CommentMO?
}
