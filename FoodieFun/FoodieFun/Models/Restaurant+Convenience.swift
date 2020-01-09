//
//  Restaurant+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

//struct Restaurants: Codable {
//    let id: Int
//    let userId: UserId
//    let restaurantName: RestaurantName
//    let cuisine: String
//    let streetAddress: StreetAddress
//    let city: String
//    let state: String
//    let zip: Int
//    var restaurantReview: RestaurantReview?
//    var restaurantRating: RestaurantRating?
//    var visitDate: VisitDate?
//    var dish_name: DishName?
//    var price: Float?
//    var dishRating: DishRating?
//    var dishReview: DishReview?
//
//}

//(id: Int, userId: UserId, restaurantName: RestaurantName, cuisine: String, streetAddress: StreetAddress, city: String, state: String, zip: Int, restaurantReview: RestaurantReview, restaurantRating: RestaurantRating, visitDate: VisitDate, dishName: DishName, price: Float, dishRating: DishRating, dishReview: DishReview, context: NSManagedObjectContext)

//(id: Int, userId: UserId, restaurantName: RestaurantName, cuisine: String, streetAddress: StreetAddress, city: String, state: String, zip: Int, context: NSManagedObjectContext)

extension Restaurants {
    
//    var restaurants: Restaurants? {
//
//        return Restaurants(id: id, userId: userId, restaurantName: restaurantName, cuisine: cuisine, streetAddress: streetAddress, city: city, state: state, zip: zip)
//    }
    
    init(id: Int, userId: UserId, restaurantName: RestaurantName, cuisine: String, streetAddress: StreetAddress, city: String, state: String, zip: Int, restaurantReview: RestaurantReview, restaurantRating: RestaurantRating, visitDate: VisitDate, dishName: DishName, price: Float, dishRating: DishRating, dishReview: DishReview, context: NSManagedObjectContext) {
        //self.init(context: context)
        self.id = id
        self.userId = userId
        self.restaurantName = restaurantName
        self.cuisine = cuisine
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.restaurantReview = restaurantReview
        self.restaurantRating = restaurantRating
        self.visitDate = visitDate
        self.dishName = dishName
        self.price = price
        self.dishRating = dishRating
        self.dishReview = dishReview
        
    }
    
}
