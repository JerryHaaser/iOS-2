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
    let itemName: ItemName
    let price: Decimal
    let rating: Decimal
    let review: String
    
}

struct ItemName: Codable {
    let itemName: String
    
    enum CodingKeys: String, CodingKey {
        case itemName = "item_name"
    }
}
