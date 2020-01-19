//
//  Restaurant+Convenience.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData



//extension RestaurantRepresentation {
//
//    @nonobjc public static func fetchRequest() -> NSFetchRequest<RestaurantRepresentation> {
//        return NSFetchRequest<RestaurantReview>(entityName: "RestaurantReview")
//    }
//
//    public var name: String
//    @NSManaged public var cuisine: String
//    @NSManaged public var address: String
//    @NSManaged public var state: String
//    @NSManaged public var city: String
//    @NSManaged public var zipcode: String
//    @NSManaged public var id: Int?
//
//}

//extension Restaurant {
//    
//    var restaurantRepresentation: RestaurantRepresentation? {
//        return RestaurantRepresentation(name: name, cuisine: cuisine, address: address, state: state, city: city, zipcode: zipcode, id: id)
//    }
//    
//    convenience init(name: String, cuisine: String, address: String, state: String, city: String, zipcode: String, id: Int16, context: NSManagedObjectContext) {
//        self.init(context: context)
//        self.name = name
//        self.cuisine = cuisine
//        self.address = address
//        self.state = state
//        self.city = city
//        self.zipcode = zipcode
//        self.id = id
//    }
//    
//        enum CodingKeys: String, CodingKey {
//            case id = "id"
//            case userId = "user_id"
//            case restaurantName = "restaurnt_name"
//            case cuisine = "cuisine"
//            case streetAddress = "street_address"
//            case city = "city"
//            case state = "state"
//            case zip = "zip"
//            case restaurantReview = "restaurant_review"
//            case restaurantRating = "restaurant_rating"
//            case visitDate = "visit_date"
////            case dishName = "dish_name"
////            case dishRating = "dish_rating"
////            case dishReview = "dish_review"
//        }
//    
//        static var jsonDecoder: JSONDecoder {
//    
//            let result = JSONDecoder()
//            return result
//    
//        }
//    
//    @discardableResult convenience init?(restaurantRepresentation: RestaurantRepresentation, context: NSManagedObjectContext) {
//        self.init(city: restaurantRepresentation.city ?? "",
//                  cuisine: restaurantRepresentation.cuisine ?? "",
////                  dishName: restaurantRepresentation.dishName ?? "",
////                  dishRating: restaurantRepresentation.dishRating ?? 0,
////                  dishReview: restaurantRepresentation.dishReview ?? "",
//                  id: restaurantRepresentation.id ?? 0,
////price: restaurantRepresentation.price ?? 0,
//                  restaurantName: restaurantRepresentation.restaurantName ?? "",
//                  restaurantRating: restaurantRepresentation.restaurantRating ?? 0,
//                  restaurantReview: restaurantRepresentation.restaurantReview ?? "",
//                  state: restaurantRepresentation.state ?? "",
//                  streetAddress: restaurantRepresentation.streetAddress ?? "",
//                  userId: restaurantRepresentation.userId ?? 0,
//                  visitDate: (restaurantRepresentation.visitDate ?? nil)!,
//                  zip: restaurantRepresentation.zip ?? 0,
//                   context: context)
//    }
//}
