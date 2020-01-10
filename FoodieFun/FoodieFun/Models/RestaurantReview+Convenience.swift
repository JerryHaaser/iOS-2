//
//  RestaurantReview+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

//struct RestaurantReview {
//let id: Int
//let restaurantId: String
//let visitDate: Date
//let review: String
//let restaurantRating: Float

//
//extension RestaurantReview {
//    
//    convenience init(id: Int16, restaurantId: Int16, visitDate: Date, review: String, restaurantRating: Float) {
//        self.id = id
//        self.restaurantId = restaurantId
//        self.visitDate = visitDate
//        self.review = review
//        self.restaurantRating = restaurantRating
//    }
//    
//}

extension RestaurantReview {
    var restaurantReviewRepresentation: RestaurantReviewRepresentation? {
        return RestaurantReviewRepresentation(id: id, restaurantId: restaurantId, restaurantRating: restaurantRating, review: review, visitDate: visitDate)
    }
    
    convenience init(id: Int16, restaurantId: Int16, restaurantRating: Float, review: String, visitDate: Date, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.restaurantId = restaurantId
        self.restaurantRating = restaurantRating
        self.review = review
        self.visitDate = visitDate
    }
    
        enum CodingKeys: String, CodingKey {
            case restaurantId = "restaurant_id"
            case visitDate = "visit_date"
            case review = "restaurant_review"
            case restaurantRating = "restaurant_rating"
        }
}
