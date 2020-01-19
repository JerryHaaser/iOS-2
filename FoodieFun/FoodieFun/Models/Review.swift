//
//  Review.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension Review {
    
    convenience init(visitDate: String,
                     review: String,
                     rating: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.init(context: context)
        self.rating = rating
        self.visitDate = visitDate
        self.review = review
    }
    
    
}
