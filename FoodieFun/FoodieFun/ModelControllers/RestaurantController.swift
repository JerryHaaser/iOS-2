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
    
    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")
    
    
    func signIn(username: String, password: String, completion: @escaping (Error?) -> Void) {
        
        guard let baseURL = baseURL else {
            NSLog("Invalid base URL")
            completion(NSError())
            return
        }
        
        let requestURL = baseURL
        .appendingPathComponent("api")
        .appendingPathComponent("auth")
        .appendingPathComponent("login")
        //Not sure these are right ^
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //Not sure these are right ^
        
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
