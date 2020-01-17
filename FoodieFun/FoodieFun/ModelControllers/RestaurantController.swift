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
    
    init() {
        fetchRestaurantsFromServer()
    }
    
    var bearer: Bearer?
    var user: User?
    var restaurant: Restaurant?
    
    let restaurantReviewController = RestaurantReviewController()
    
    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")
    
    func fetchRestaurantsFromServer(completion: @escaping () -> Void = { }) {
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion()
            return
        }
        
        guard let user = user else {
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("users")
            .appendingPathComponent("\(user.userId)")
            .appendingPathComponent("restaurants")
        
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error fetching restaurants: \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from restaurant fetch data task")
                completion()
                return
            }
            
            do {
                let restaurants = try JSONDecoder().decode([RestaurantRepresentation].self, from: data)
                self.updateRestaurant(with: restaurants)
            } catch {
                NSLog("Error decoding ChoreRepresentations: \(error)")
            }
            
            completion()
        }.resume()
    }
    
    func updateRestaurant(with representations: [RestaurantRepresentation]) {
        
        let idsToFetch = representations.map({ $0.id })
        
        let represtationsByID = Dictionary(uniqueKeysWithValues: zip(idsToFetch, representations))
        
        var restaurantsToCreate = represtationsByID
        
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.performAndWait {
            do {
                let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
                
                fetchRequest.predicate = NSPredicate(format: "id IN %@", idsToFetch)
                
                let existingRestaurants = try context.fetch(fetchRequest)
                
                for restaurant in existingRestaurants {
                    let id = restaurant.id
                    
                    guard let representation = represtationsByID[id] else { continue }
                    
                    restaurant.city = representation.city
                    restaurant.cuisine = representation.cuisine
                    restaurant.restaurantName = representation.restaurantName
                    restaurant.restaurantRating = representation.restaurantRating ?? 0
                    restaurant.restaurantReview = representation.restaurantReview
                    
                    restaurantsToCreate.removeValue(forKey: id)
                }
                
                CoreDataStack.shared.save(context: context)
            } catch {
                NSLog("Error fetching restaurants from persistent store: \(error)")
            }
        }
        
    }
    
    func createRestaurant(_ city: String, cuisine: String, id: Int16, restaurantName: String, restaurantRating: Float, restaurantReview: String, state: String, streetAddress: String, userId: Int16, visitDate: Date, zip: Int16) {
        
        let createdRestaurant = Restaurant(city: city, cuisine: cuisine, id: id, restaurantName: restaurantName, restaurantRating: restaurantRating, restaurantReview: restaurantReview, state: state, streetAddress: streetAddress, userId: userId, visitDate: visitDate, zip: zip, context: CoreDataStack.shared.mainContext)
        // Changed for networking
        self.restaurant = createdRestaurant
        CoreDataStack.shared.save()
        
    }
    
    func updateRestaurant(updateRestaurant event: Restaurant) {
        let _ = event
        deleteClass(forClass: event)
        CoreDataStack.saveContext()
    }
    
//    func updateIsReserved(forClass eventClass: Restaurant) {
//        eventClass.isReserved = !eventClass.isReserved
//        CoreDataStack.saveContext()
//    }
    
    func deleteClass(forClass instructorClass: Restaurant) {
        CoreDataStack.context.delete(instructorClass)
        CoreDataStack.saveContext()
    }

    
    func signIn(username: String, password: String, completion: @escaping (Error?) -> Void) {
        
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion(NSError())
            return
        }
        
        let requestURL = baseURL
        .appendingPathComponent("auth")
        .appendingPathComponent("login")
        print(requestURL)
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let login = ["username": "jerry", "password": "password"]
        
        do {
            let loginJSON = try JSONEncoder().encode(login)
            request.httpBody = loginJSON
        } catch {
            NSLog("Error encoding login data: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                NSLog("Error signing in: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("No data return from data task")
                completion(NSError())
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                print(loginResponse)
                
                let bearer = Bearer(token: loginResponse.token)
                self.bearer = bearer
                
                let user = User(token: loginResponse.token, userId: loginResponse.userId, message: loginResponse.message)
                self.user = user

                self.restaurantReviewController.fetchRestaurantReviewsFromServer()


                
            } catch {
                NSLog("Error decdoing login response: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
        
    }
    
}
