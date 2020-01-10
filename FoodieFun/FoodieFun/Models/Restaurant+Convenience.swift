//
//  Restaurant+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension Restaurant {
    
    var restaurantRepresentation: RestaurantRepresentation? {
        return RestaurantRepresentation(city: city, cuisine: cuisine, id: id, restaurantName: restaurantName, restaurantRating: restaurantRating, restaurantReview: restaurantReview, state: state, streetAddress: streetAddress, userId: userId, visitDate: visitDate, zip: zip)
    }
    
    convenience init(city: String, cuisine: String, id: Int16, restaurantName: String, restaurantRating: Float, restaurantReview: String, state: String, streetAddress: String, userId: Int16, visitDate: Date, zip: Int16, context: NSManagedObjectContext) {
        self.init(context: context)
        self.city = city
        self.cuisine = cuisine
//        self.dishName = dishName
//        self.dishRating = dishRating
//        self.dishReview = dishReview
        self.id = id
//        self.price = price
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
//            case dishName = "dish_name"
//            case dishRating = "dish_rating"
//            case dishReview = "dish_review"
        }
    
        static var jsonDecoder: JSONDecoder {
    
            let result = JSONDecoder()
            return result
    
        }
    
    @discardableResult convenience init?(restaurantRepresentation: RestaurantRepresentation, context: NSManagedObjectContext) {
        self.init(city: restaurantRepresentation.city ?? "",
                  cuisine: restaurantRepresentation.cuisine ?? "",
//                  dishName: restaurantRepresentation.dishName ?? "",
//                  dishRating: restaurantRepresentation.dishRating ?? 0,
//                  dishReview: restaurantRepresentation.dishReview ?? "",
                  id: restaurantRepresentation.id ?? 0,
//price: restaurantRepresentation.price ?? 0,
                  restaurantName: restaurantRepresentation.restaurantName ?? "",
                  restaurantRating: restaurantRepresentation.restaurantRating ?? 0,
                  restaurantReview: restaurantRepresentation.restaurantReview ?? "",
                  state: restaurantRepresentation.state ?? "",
                  streetAddress: restaurantRepresentation.streetAddress ?? "",
                  userId: restaurantRepresentation.userId ?? 0,
                  visitDate: (restaurantRepresentation.visitDate ?? nil)!,
                  zip: restaurantRepresentation.zip ?? 0,
                   context: context)
    }
}
