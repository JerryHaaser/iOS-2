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
            .appendingPathComponent("\(user.id)")
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
    
    //        func fetch<T: Codable>(from url: URL, using session: URLSession = URLSession.shared, completion: @escaping (T?, Error?) -> Void) {
    //
    //            session.dataTask(with: url) { (data, response, error) in
    //
    //                if let response = response as? HTTPURLResponse,
    //                    response.statusCode != 200 {
    //                    print(response.statusCode)
    //                    completion(nil, error)
    //                    return
    //                }
    //
    //                if let error = error {
    //                    completion(nil, error)
    //                    return
    //                }
    //
    //                guard let data = data else {
    //                    completion(nil, NSError(domain: "com.labmbdaSchool.RandomUser.ErrorDomain", code: -1, userInfo: nil))
    //                    return
    //                }
    //
    //                do {
    //                    let jsonDecoder = Restaurants.jsonDecoder
    //                    let decodedObject = try jsonDecoder.decode(T.self, from: data)
    //                    completion(decodedObject, nil)
    //                } catch {
    //                    completion(nil, error)
    //                }
    //            }.resume()
    //        }
            
            
    
    
    func signIn(username: String, password: String, completion: @escaping (Error?) -> Void) {
        
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion(NSError())
            return
        }
        
        let requestURL = baseURL
        .appendingPathComponent("auth")
        .appendingPathComponent("login")
        //Not sure these are right ^
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        

        let login = ["username": username, "password": password]
        
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
                
                let bearer = Bearer(token: loginResponse.token)
                self.bearer = bearer
                
                let user = User(id: loginResponse.userId,
                                username: <#T##String#>,
                                email: <#T##String#>,
                                password: password,
                                city: <#T##String#>,
                                state: <#T##String#>)
                self.user = user
                
                
                
            } catch {
                NSLog("Error decdoing login response: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
        
    }
    
}
