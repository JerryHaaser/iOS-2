//
//  RestaurantReview.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct RestaurantReview {
    let id: Int
    let restaurantId: RestaurantId
    let visitDate: VisitDate
    let review: Review
    let restaurantRating: RestaurantRating
}

struct RestaurantId: Codable {
    let restaurantId: String
    
    enum CodingKeys: String, CodingKey {
        case restaurantId = "restaurant_id"
    }
}

struct Review: Codable {
    let review: String
    
    enum CodingKeys: String, CodingKey {
        case review = "restaurant_review"
    }
}

struct VisitDate: Codable {
    let visitDate: Date
    
    enum CodingKeys: String, CodingKey {
        case visitDate = "visit_date"
    }
}

struct RestaurantRating: Codable {
    let restaurantRating: Float
    
    enum CodingKeys: String, CodingKey {
        case restaurantRating = "restaurant_rating"
    }
}



