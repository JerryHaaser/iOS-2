//
//  RestaurantRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct RestaurantRepresentation: Codable {
    let name: String
    let cuisine: String
     let address: String
     let state: String
     let city: String
     let zipcode: String
     let id: Int?
     
     private enum ResaurantCodingKeys: String, CodingKey {
         case name = "restaurant_name"
         case address
         case state
         case zipcode
         case city
         case cuisine
         case id
     }

}
//    var city: String?
//    var cuisine: String?
////    var dishName: String?
////    var dishRating: Float?
////    var dishReview: String?
//    var id: Int16?
////    var price: Float?
//    var restaurantName: String?
//    var restaurantRating: Float?
//    var restaurantReview: String?
//    var state: String?
//    var streetAddress: String?
//    var userId: Int16?
//    var visitDate: Date?
//    var zip: Int16?
