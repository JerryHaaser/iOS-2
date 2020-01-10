//
//  LoginResponse.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/7/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
    let userId: Int
    let email: String
    let city: String
    let state: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case userId = "user_id"
        case email = "email"
        case city = "city"
        case state = "state"
    }
}
