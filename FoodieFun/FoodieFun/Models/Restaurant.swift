//
//  Restaurant.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension Restaurant {
    
    convenience init(name: String,
                     cuisine: String,
                     address: String,
                     city: String,
                     state: String,
                     zipcode: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.init(context: context)
        self.name = name
        self.cuisine = cuisine
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.address = address
    }
    
}
