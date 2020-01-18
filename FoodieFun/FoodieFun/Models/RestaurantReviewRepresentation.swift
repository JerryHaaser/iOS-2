//
//  RestaurantReviewRepresentation.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation

struct RestaurantReviewRepresentation: Codable {

    let id: Int?
    let title: String?
    let restaurantReview: String?
    let rating: String?
    let date: Date?
        
        private enum ResaurantReviewRepresentationCodingKeys: String, CodingKey {
            case id
            case title
            case restaurantReview
            case rating
            case date

        }
    
}
//var id: Int16?
//var restaurantId: Int16?
//var restaurantRating: Float?
//var review: String?
//var visitDate: Date?
