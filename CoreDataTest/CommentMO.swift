//
//  CommentMO.swift
//  CoreDataTest
//
//  Created by Alice Newman on 5/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import CoreData

class CommentMO: NSManagedObject {
    @NSManaged var body: String
    @NSManaged var id: Double
    @NSManaged var created_at: String
    @NSManaged var updated_at: String
    @NSManaged var avg_vote_count: Int
    @NSManaged var downvote_count: Int
    @NSManaged var upvote_count: Int
    @NSManaged var user_id: UserMO?

}
