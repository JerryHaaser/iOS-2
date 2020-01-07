//
//  UserRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    let id: UUID
    let username: String
    let email: String
    let password: String
    let city: String
    let state: String
}
