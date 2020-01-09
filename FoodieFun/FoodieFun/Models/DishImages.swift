//
//  MenuItemPhoto.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct DishImages: Codable {
    let id: Int
    let dishId: DishId
    let dishImageURL: DishImageURL
}

struct DishId: Codable {
    let dishId: Int
    
    enum CodingKeys: String, CodingKey {
        case dishId = "dish_id"
    }
}

struct DishImageURL: Codable {
    let dishImageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case dishImageURL = "dish_image_url"
    }
}
