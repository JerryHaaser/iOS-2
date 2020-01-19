//
//  User.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    convenience init(userName: String,
                     email: String,
                     city: String,
                     state: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.context) {
        
        self.init(context:context)
        self.userName = userName
        self.email = email
        self.state = state
        self.city = city
    }
}
