//
//  DishReviewRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct DishReviewRepresentation: Codable {
    
    var dishName: String?
    var dishRating: Float?
    var dishReview: String?
    var id: Int16?
    var price: Float?
    var restaurantId: Int16?
    
}
