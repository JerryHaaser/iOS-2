//
//  MenuItemPhoto.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct MenuItemPhoto: Codable {
    let id: Int
    let menuItemReviewId: MenuItemReviewId
    let photo: Vachar
}

struct MenuItemReviewId: Codable {
    let menuItemReviewId: Int
    
    enum CodingKeys: String, CodingKey {
        case menuItemReviewId = "menu_Item_review_id"
    }
}
