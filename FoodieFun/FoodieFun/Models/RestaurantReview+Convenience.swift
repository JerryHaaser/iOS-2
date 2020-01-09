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
//    let id: Int
//    let restaurantId: RestaurantId
//    let visitDate: VisitDate
//    let review: Review
//    let restaurantRating: RestaurantRating
//}


extension RestaurantReview {
    
    init(id: Int, restaurantId: RestaurantId, visitDate: VisitDate, review: Review, restaurantRating: RestaurantRating) {
        self.id = id
        self.restaurantId = restaurantId
        self.visitDate = visitDate
        self.review = review
        self.restaurantRating = restaurantRating
    }
    
}
