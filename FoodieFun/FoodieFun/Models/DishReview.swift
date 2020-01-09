//
//  MenuItemReview.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct DishReview: Codable {
    let id: Int
    let restaurantId: RestaurantId
    let dishName: DishName
    let price: Float
    let dishRating: DishRating
    let dishReview: DREview
    
}

struct DishName: Codable {
    let dishName: String
    
    enum CodingKeys: String, CodingKey {
        case dishName = "dish_name"
    }
}

struct DishRating: Codable {
    let dishRating: Float
    
    enum CodingKeys: String, CodingKey {
        case dishRating = "dish_rating"
    }
}

struct DREview: Codable {
    let dishReview: String
    
    enum CodingKeys: String, CodingKey {
        case dishReview = "dish_review"
    }
}
