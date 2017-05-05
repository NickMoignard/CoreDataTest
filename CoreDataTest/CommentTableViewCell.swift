//
//  CommentTableViewCell.swift
//  CoreDataTest
//
//  Created by Alice Newman on 5/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    
    
    // Outlets
    @IBOutlet weak var commentBody: UILabel!
    @IBOutlet weak var commentTimePassedLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    // Actions
    @IBAction func upvote(_ sender: Any) {
        //...
    }
    
}
