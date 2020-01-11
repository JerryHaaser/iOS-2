//
//  RestaurantReviewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

class RestaurantReviewController {
    
    init() {
        fetchRestaurantReviewsFromServer()
    }
    
    var bearer: Bearer?
    var user: User?
    var restaurant: Restaurant?
    
    let dishReviewController = DishReviewController()
    
    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")
    //https://foodie-fun-be.herokuapp.com/user/1/restaurants/1/reviews
    
    func fetchRestaurantReviewsFromServer(completion: @escaping () -> Void = { }) {
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion()
            return
        }
        
        guard let user = user else {
            return
        }
        
        guard let restaurant = restaurant else {
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("user")
            .appendingPathComponent("\(user.userId)")
            .appendingPathComponent("restaurants")
            .appendingPathComponent("\(restaurant.id)")
            .appendingPathComponent("reviews")
        
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error fetching restaurant reviews: \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from restaurant review fetch data task")
                completion()
                return
            }
            
            do {
                let restaurantReviews = try JSONDecoder().decode([RestaurantReviewRepresentation].self, from: data)
                self.updateRestaurantReviews(with: restaurantReviews)
            } catch {
                NSLog("Error decoding RestaurantReviewRepresentation: \(error)")
            }
            completion()
        }.resume()
        
    }
    
    func updateRestaurantReviews(with representations: [RestaurantReviewRepresentation]) {
        let idsToFetch = representations.map({ $0.restaurantId })
        
        let representationsByID = Dictionary(uniqueKeysWithValues: zip(idsToFetch, representations))
        
        var restaurantReviewsToCreate = representationsByID
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.performAndWait {
            do {
                let fetchRequest: NSFetchRequest<RestaurantReview> = RestaurantReview.fetchRequest()
               
                fetchRequest.predicate = NSPredicate(format: "restaurantId IN @%", idsToFetch)
                
                let existingRestaurantReviews = try context.fetch(fetchRequest)
                
                for restaurantReview in existingRestaurantReviews {
                    let id = restaurantReview.id
                    
                    guard let representation = representationsByID[id] else { continue }
                    
                    restaurantReview.restaurantRating = representation.restaurantRating ?? 0
                    restaurantReview.review = representation.review ?? ""
                    restaurantReview.restaurantId = representation.restaurantId ?? 0
                    
                    restaurantReviewsToCreate.removeValue(forKey: id)
                }
                
                for representation in restaurantReviewsToCreate.values {
                    RestaurantReview(restaurantReviewRepresentation: representation, context: context)
                }
                CoreDataStack.shared.save(context: context)
                
            } catch {
                NSLog("Error fetching restaurant reviews from persistent store: \(error)")
            }
        }
    }
    
}
