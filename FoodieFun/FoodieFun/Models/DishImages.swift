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
    let dishId: Int
    let dishImageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case dishId = "dish_id"
        case dishImageURL = "dish_image_url"
    }
}

