//
//  UserRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    
    let userName: String
     let email: String
     let city: String
     let state: String
     
    private enum UserCodingKeys: String, CodingKey {
         case userName = "username"
         case email
         case city
         case state
     }
     
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: UserCodingKeys.self)
         userName = try container.decode(String.self, forKey: .userName)
         email = try container.decode(String.self, forKey: .email)
         city = try container.decode(String.self, forKey: .city)
         state = try container.decode(String.self, forKey: .state)
     }
     
     init(userName: String, email: String, city: String, state: String) {
         self.userName = userName
         self.email = email
         self.city = city
         self.state = state
     }
    
    
}


//let id: UUID
//let username: String
//let email: String
//let password: String
//let city: String
//let state: String
