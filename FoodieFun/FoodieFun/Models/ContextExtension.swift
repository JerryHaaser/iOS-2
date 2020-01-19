//
//  ContextExtension.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveChanges() {
        if hasChanges {
            do {
                try save()
            } catch {
                NSLog("failed to save to context: \(error)")
            }
        }
    }
    
}
