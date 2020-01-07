//
//  MenuItemReview.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct MenuItemReview: Codable {
    let id: Int
    let restaurantId: RestaurantId
    let restaurantName: RestaurantName
    let price: Decimal
    let rating: Decimal
    let review: String
    
}

struct RestaurantName: Codable {
    let restaurantName: String
    
    enum CodingKeys: String, CodingKey {
        case restaurantName = "restaurant_name"
    }
}

struct ItemName: Codable {
    let itemName: String
    
    enum CodingKeys: String, CodingKey {
        case itemName = "item_name"
    }
}
