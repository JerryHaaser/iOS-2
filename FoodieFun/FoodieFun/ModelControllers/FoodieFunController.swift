//
//  FoodieFunController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

class FoodieFunController {
    
    func createUser(withUserName userName: String,
                    email: String,
                    state: String,
                    city: String,
                    context: NSManagedObjectContext = CoreDataStack.shared.context) {
        let user = User(userName: userName, email: email, city: city, state: state, context: context)
        CoreDataStack.shared.context.saveChanges()
    }
    
    
    func createRestuarant(name: String,
                          cuisine: String,
                          address: String,
                          state: String,
                          city: String,
                          zipcode: String,
                          context: NSManagedObjectContext = CoreDataStack.shared.context) {
        
        let restaurant = Restaurant(name: name, cuisine: cuisine, address: address, city: city, state: state, zipcode: zipcode, context: context)
        CoreDataStack.shared.context.saveChanges()
    }
    
    func addReview(withRating rating: String, visitDate: String, review: String, context: NSManagedObjectContext = CoreDataStack.shared.context) {
        let review = Review(visitDate: visitDate, review: review, rating: rating, context: context)
        CoreDataStack.shared.context.saveChanges()
    }
    
}
