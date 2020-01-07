//
//  Restaurants.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct Restaurants: Codable {
    let id: Int
    let userId: UserId
    let name: String
    let cuisine: String
    let streetAddress: StreetAddress
    let city: String
    let state: String
}

struct UserId: Codable {
    let userId: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
    }
}

struct StreetAddress: Codable {
    let streetAddress: String
    
    enum CodingKeys: String, CodingKey {
        case streetAddress = "street_address"
    }
}

//struct RestaurantReview {
//    let id: Int
//    let restaurantId: RestaurantId
//    let visitDate: VisitDate
//    let review: String
//    let serviceExperience: ServiceExperience
//    let timeToSeating: TimeToSeating
//    let rating: Decimal
//}
//
//struct RestaurantId: Codable {
//    let restaurantId: String
//    
//    enum CodingKeys: String, CodingKey {
//        case restaurantId = "restaurant_id"
//    }
//}
//
//struct VisitDate: Codable {
//    let visitDate: Date
//    
//    enum CodingKeys: String, CodingKey {
//        case visitDate = "visit_date"
//    }
//}
//
//struct ServiceExperience: Codable {
//    let serviceExperience: String
//    
//    enum CodingKeys: String, CodingKey {
//        case serviceExperience = "service_experience"
//    }
//}
//
//struct TimeToSeating: Codable {
//    let timeToSeating: Date
//    
//    enum CodingKeys: String, CodingKey {
//        case timeToSeating = "time_to_seating"
//    }
//}
