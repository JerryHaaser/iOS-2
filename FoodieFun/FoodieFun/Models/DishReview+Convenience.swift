//
//  DishReview+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

//struct DishReview: Codable {
//    let id: Int
//    let restaurantId: String
//    let dishName: String
//    let price: Float
//    let dishRating: Float
//    let dishReview: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case restaurantId = "restaurant_id"
//        case dishName = "dish_name"
//        case price = "price"
//        case dishRating = "dish_rating"
//        case dishReview = "dish_review"
//    }
//}

//extension DishReview {
//    
//    convenience init(id: Int, restaurantId: Int, dishName: String, price: Float, dishRating: Float, dishReview: String) {
//        self.id = Int16(id)
//        self.restaurantId = restaurantId
//        self.dishName = dishName
//        self.price = price
//        self.dishRating = dishRating
//        self.dishReview = dishReview
//    }
//    
//}

extension DishReview {
    var dishReviewRepresentation: DishReviewRepresentation? {
        return DishReviewRepresentation(dishName: dishName, dishRating: dishRating, dishReview: dishReview, id: id, price: price, restaurantId: restaurantId)
    }
    
    convenience init(dishName: String, dishRating: Float, dishReview: String, id: Int16, price: Float, restaurantId: Int16, context: NSManagedObjectContext) {
        self.init(context: context)
        self.dishName = dishName
        self.dishRating = dishRating
        self.dishReview = dishReview
        self.id = id
        self.price = price
        self.restaurantId = restaurantId
    }
    
}
