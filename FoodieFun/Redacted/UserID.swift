//
//  UserID.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/17/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct UserID: Codable {
    let userID: Int
    
    private enum IDCodingKeys: String, CodingKey {
        case id = "user_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: IDCodingKeys.self)
        userID = try container.decode(Int.self, forKey: .id)
    }
}
