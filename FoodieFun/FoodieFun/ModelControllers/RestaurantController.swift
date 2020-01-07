//
//  RestaurantController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/7/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class RestaurantController {
    
    var bearer: Bearer?
    var user: User?
    
    let restaurantController = RestaurantController()
    
    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")
    
    
    
}
