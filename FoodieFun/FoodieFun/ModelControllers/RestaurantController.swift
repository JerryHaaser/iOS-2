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
    
//    init() {
//        fetchRestaurantsFromServer()
//    }
    
    init(token: BearerToken? = nil, id: UserID? = nil) {
        self.token = token
        self.userID = id
    }
    
    var bearer: BearerToken?
    var user: UserRepresentation?
    var restaurant: RestaurantRepresentation?
    var userID: UserID?
    
    let restaurantReviewController = RestaurantReviewController()
    
    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")
    
//    func fetchRestaurantsFromServer(completion: @escaping () -> Void = { }) {
//        guard let baseURL = baseURL else {
//            NSLog("Invalid base URL")
//            completion()
//            return
//        }
//
//        guard let user = user else {
//            return
//        }
//
//        let requestURL = baseURL
//            .appendingPathComponent("users")
//            //Not sure if userID will work. was user.userId
//            .appendingPathComponent("\(String(describing: userID))")
//            .appendingPathComponent("restaurants")
//
//        let request = URLRequest(url: requestURL)
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                NSLog("Error fetching restaurants: \(error)")
//                completion()
//                return
//            }
//
//            guard let data = data else {
//                NSLog("No data returned from restaurant fetch data task")
//                completion()
//                return
//            }
//
//            do {
//                let restaurants = try JSONDecoder().decode([RestaurantRepresentation].self, from: data)
//                self.updateRestaurant(with: restaurants)
//            } catch {
//                NSLog("Error decoding ChoreRepresentations: \(error)")
//            }
//
//            completion()
//        }.resume()
//    }
//
//    func updateRestaurant(with representations: [RestaurantRepresentation]) {
//
//        let idsToFetch = representations.map({ $0.id })
//
//        let represtationsByID = Dictionary(uniqueKeysWithValues: zip(idsToFetch, representations))
//
//        var restaurantsToCreate = represtationsByID
//
//        let context = CoreDataStack.shared.container.newBackgroundContext()
//
//        context.performAndWait {
//            do {
//                let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
//
//                fetchRequest.predicate = NSPredicate(format: "id IN %@", idsToFetch)
//
//                let existingRestaurants = try context.fetch(fetchRequest)
//
//                for restaurant in existingRestaurants {
//                    let id = restaurant.id
//
//                    guard let representation = represtationsByID[id] else { continue }
//
//                    restaurant.city = representation.city
//                    restaurant.cuisine = representation.cuisine
//                    restaurant.restaurantName = representation.restaurantName
//                    restaurant.restaurantRating = representation.restaurantRating ?? 0
//                    restaurant.restaurantReview = representation.restaurantReview
//
//                    restaurantsToCreate.removeValue(forKey: id)
//                }
//
//                CoreDataStack.shared.save(context: context)
//            } catch {
//                NSLog("Error fetching restaurants from persistent store: \(error)")
//            }
//        }
//
//    }
    
    func login(withUsername username: String, password: String, completion: @escaping(NSError?) -> Void = { _ in }) {
       let loginURL = baseURL?.appendingPathComponent("auth").appendingPathComponent("login")
        guard let loginUrl = loginURL else { return completion(nil) }
        
        var request = URLRequest(url: loginUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        let json = """
        {
        "username" : "\(username)",
        "password" : "\(password)"
        }
        """
        
        let jsonData = json.data(using: .utf8)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                NSLog("error logging in user: \(error)")
                completion(error)
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.userID = try decoder.decode(UserID.self, from: data)
                self.token = try decoder.decode(BearerToken.self, from: data)
            } catch let error as NSError {
                NSLog("failed to decode data: \(error)")
                completion(error)
            }
            completion(nil)
        }.resume()
    }
    
    func register(user: User, withPassword password: String, completion: @escaping(NSError?) -> Void = {_ in }) {
       let registerURL = baseURL?.appendingPathComponent("auth").appendingPathComponent("register")
        guard let registerUrl = registerURL else { return completion(nil) }
        
        var request = URLRequest(url: registerUrl)
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        request.httpMethod = "POST"
         let json = """
        {
       "username" : "\(user.userName)",
       "password" : "\(password)",
         "email" : "\(user.email)",
          "city" : "\(user.city)" ,
         "state" : "\(user.state)"
        }
       """
       
       let jsonData = json.data(using: .utf8)
       request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                print("error logging in user: \(error)")
                completion(error)
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
             print(String(data: data, encoding: .utf8))
            self.restaurant = try decoder.decode(Restaurant.self, from: data)
            } catch let error as NSError {
                NSLog("failed to decode data: \(error)")
                completion(error)
            }
            completion(nil)
        }.resume()
    }
    
    func addRestuarant(restaurant: Restaurant, completion: @escaping(NSError?) -> Void = {_ in }) {
            guard let id = userID else { return }
            let restaurantURL = baseURL?.appendingPathComponent("user").appendingPathComponent("\(id)").appendingPathComponent("restaurants")
            guard let url = restaurantURL else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let json = """
       {
            "user_id": "\(id)",
            "restaurant_name": "\(restaurant.name)",
            "cuisine": "\(restaurant.cuisine)",
            "street_address": "\(restaurant.address)",
            "city": "\(restaurant.city)",
            "state": "\(restaurant.state)",
            "zip": "\(restaurant.zipcode)"
        }
    """
            let jsonData = json.data(using: .utf8)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error as NSError? {
                               print("error logging in user: \(error)")
                               completion(error)
                           }
                           if let response = response as? HTTPURLResponse {
                               print(response.statusCode)
                           }
                           guard let data = data else { return }

                           do {
                               let decoder = JSONDecoder()
                            print(String(data: data, encoding: .utf8))
                           self.user = try decoder.decode(User.self, from: data)
                           self.token = try decoder.decode(BearerToken.self, from: data)
                           } catch let error as NSError {
                               NSLog("failed to decode data: \(error)")
                               completion(error)
                           }
                           completion(nil)
            }.resume()
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
                
                let bearer = BearerToken(token: loginResponse.token)
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
