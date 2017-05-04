//
//  TodoListDataSource.swift
//  CoreDataTest
//
//  Created by Alice Newman on 4/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TodoListDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int    {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
