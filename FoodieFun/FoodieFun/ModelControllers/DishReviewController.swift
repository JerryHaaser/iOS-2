//
//  DishReviewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/9/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

//class DishReviewController {
//    
//    let baseURL = URL(string: "https://foodie-fun-be.herokuapp.com")!
//    //https://foodie-fun-be.herokuapp.com/user/8/restaurants/1/dishes
//    
//    func fetchDishReviewsFromSever(userId: Int16, restaurantId: Int16, completion: @escaping () -> Void = { }) {
//        
//        let requestURL = baseURL
//        .appendingPathComponent("user")
//        .appendingPathComponent("\(userId)")
//        .appendingPathComponent("restaurants")
//        .appendingPathComponent("\(restaurantId)")
//        .appendingPathComponent("dishes")
//        
//        let request = URLRequest(url: requestURL)
//        
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                NSLog("Error fetching tasks: \(error)")
//                completion()
//                return
//            }
//            
//            guard let data = data else {
//                NSLog("No data returned from task fetch data task")
//                completion()
//                return
//            }
//            
//            do {
//                let dishReviews = try JSONDecoder().decode([DishReviewRepresentation].self,
//                from: data)
//                self.updateDishReview(with: dishReviews)
//            } catch {
//                NSLog("Error decoding DishReviewRepresentation: \(error)")
//            }
//            
//            completion()
//        }.resume()
//    }
//    
//    func updateDishReview(with representations: [DishReviewRepresentation]) {
//        
//        let namesToFetch = representations.map({ $0.dishName})
//        
//        let representationsByName = Dictionary(uniqueKeysWithValues: zip(namesToFetch, representations))
//        
//        var assignmentsToCreate = representationsByName
//        let context = CoreDataStack.shared.container.newBackgroundContext()
//        
//        context.performAndWait {
//            do {
//                let fetchRequest: NSFetchRequest<DishReview> = DishReview.fetchRequest()
//                fetchRequest.predicate = NSPredicate(format: "dishName IN %@", namesToFetch)
//                let existingAssignments = try context.fetch(fetchRequest)
//                
//                for assignment in existingAssignments {
//                    guard let name = assignment.dishName,
//                        let representation = representationsByName[name] else { continue }
//                    
//                    assignment.dishReview = representation.dishReview
//                    assignment.dishRating = representation.dishRating ?? 0
//                    
//                    assignmentsToCreate.removeValue(forKey: name)
//                }
//                
//                for representation in assignmentsToCreate.values {
//                    DishReview(dishReviewRepresentation: representation, context: context)
//                }
//                
//                CoreDataStack.shared.save(context: context)
//            } catch {
//                NSLog("Error fetching assignments from persistent store: \(error)")
//            }
//        }
//        
//    }
//    
//    
//}
