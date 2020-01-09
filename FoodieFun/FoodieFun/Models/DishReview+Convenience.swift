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
//    let restaurantId: RestaurantId
//    let itemName: ItemName
//    let price: Decimal
//    let rating: Decimal
//    let review: String
//
//}

extension DishReview {
    
    init(id: Int, restaurantId: RestaurantId, itemName: ItemName, price: Decimal, rating: Decimal, review: String) {
        self.id = id
        self.restaurantId = restaurantId
        self.itemName = itemName
        self.price = price
        self.rating = rating
        self.review = review
    }
    
}
