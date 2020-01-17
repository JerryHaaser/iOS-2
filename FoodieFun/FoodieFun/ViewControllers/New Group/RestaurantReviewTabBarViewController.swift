//
//  RestaurantReviewTabBarViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class RestaurantReviewTabBarViewController: UITabBarController {
    
    var restaurantsController = RestaurantController()
    
    var restaurantDetailVC: RestaurantDetailViewController?
    var restaurantMenuItemCollectionVC: RestaurantMenuItemCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewControllers = viewControllers {
            for vc in viewControllers {
                if let navigationVC = vc as? UINavigationController {
                    for vc in navigationVC.viewControllers {
                        if let restaurantDetailVC = vc as? RestaurantDetailViewController {
                            restaurantDetailVC.restaurantsController = restaurantsController
                            self.restaurantDetailVC = restaurantDetailVC
                        }
                    }
                } else if let restaurantMenuItemCollectionVC = vc as? RestaurantMenuItemCollectionViewController {
                    restaurantDetailVC?.restaurantsController = restaurantsController
                    self.restaurantMenuItemCollectionVC = restaurantMenuItemCollectionVC
                }
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
