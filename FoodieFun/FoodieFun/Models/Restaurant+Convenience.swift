//
//  Restaurant+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData
//
//extension Restaurant {
//    
//    init(id: Int, userId: String, restaurantName: String, cuisine: String, streetAddress: String, city: String, state: String, zip: Int, restaurantReview: String, restaurantRating: Int, visitDate: Date, dishName: String, price: Float, dishRating: Float, dishReview: String, context: NSManagedObjectContext) {
//        
//        self.id = id
//        self.userId = userId
//        self.restaurantName = restaurantName
//        self.cuisine = cuisine
//        self.streetAddress = streetAddress
//        self.city = city
//        self.state = state
//        self.zip = zip
//        self.restaurantReview = restaurantReview
//        self.restaurantRating = restaurantRating
//        self.visitDate = visitDate
//        self.dishName = dishName
//        self.price = price
//        self.dishRating = dishRating
//        self.dishReview = dishReview
//        //self.init(context: context)
//    }
//    
//}

extension Restaurant {
    
    var restaurantRepresentation: RestaurantRepresentation? {
        return RestaurantRepresentation(city: city, cuisine: cuisine, dishName: dishName, dishRating: dishRating, dishReview: dishReview, id: id, price: price, restaurantName: restaurantName, restaurantRating: restaurantRating, restaurantReview: restaurantReview, state: state, streetAddress: streetAddress, userId: userId, visitDate: visitDate, zip: zip)
    }
    
    convenience init(city: String, cuisine: String, dishName: String, dishRating: Float, dishReview: String, id: Int16, price: Float, restaurantName: String, restaurantRating: Float, restaurantReview: String, state: String, streetAddress: String, userId: Int16, visitDate: Date, zip: Int16, context: NSManagedObjectContext) {
        self.init(context: context)
        self.city = city
        self.cuisine = cuisine
        self.dishName = dishName
        self.dishRating = dishRating
        self.dishReview = dishReview
        self.id = id
        self.price = price
        self.restaurantName = restaurantName
        self.restaurantRating = restaurantRating
        self.restaurantReview = restaurantReview
        self.state = state
        self.streetAddress = streetAddress
        self.userId = userId
        self.visitDate = visitDate
        self.zip = zip
    }
    
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case userId = "user_id"
            case restaurantName = "restaurnt_name"
            case cuisine = "cuisine"
            case streetAddress = "street_address"
            case city = "city"
            case state = "state"
            case zip = "zip"
            case restaurantReview = "restaurant_review"
            case restaurantRating = "restaurant_rating"
            case visitDate = "visit_date"
            case dishName = "dish_name"
            case dishRating = "dish_rating"
            case dishReview = "dish_review"
        }
    
        static var jsonDecoder: JSONDecoder {
    
            let result = JSONDecoder()
            return result
    
        }
    
//    @discardableResult convenience init?(restaurantRepresentation: RestaurantRepresentation, context: NSManagedObjectContext) {
//        self.init(city: restaurantRepresentation.city,
//                   cuisine: restaurantRepresentation.cuisine,
//                   dishName: restaurantRepresentation.dishName,
//                   dishRating: restaurantRepresentation.dishRating,
//                   dishReview: restaurantRepresentation.dishReview,
//                   id: restaurantRepresentation.id,
//                   price: restaurantRepresentation.price,
//                   restaurantName: restaurantRepresentation.restaurantName,
//                   restaurantRating: restaurantRepresentation.restaurantRating,
//                   restaurantReview: restaurantRepresentation.restaurantReview,
//                   state: restaurantRepresentation.state,
//                   streetAddress: restaurantRepresentation.streetAddress,
//                   userId: restaurantRepresentation.userId,
//                   visitDate: restaurantRepresentation.visitDate,
//                   zip: restaurantRepresentation.zip)
//    }
//
}
