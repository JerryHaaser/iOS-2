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
    let userId: UserId
}