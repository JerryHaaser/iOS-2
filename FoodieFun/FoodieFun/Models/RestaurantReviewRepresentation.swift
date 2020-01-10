//
//  RestaurantReviewRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct RestaurantReviewRepresentation: Codable {
    
    var id: Int16?
    var restaurantId: Int16?
    var restaurantRating: Float?
    var review: String?
    var visitDate: Date?
    
}
