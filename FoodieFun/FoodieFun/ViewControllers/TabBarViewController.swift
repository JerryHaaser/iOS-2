//
//  TabBarViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

protocol TabBarDelegate {
    
}

class TabBarViewController: UITabBarController {
    
    var restaurantController = RestaurantController()
    
    var restaurantListTableVC: RestaurantListTableViewController?
    var userInformationVC: UserInformationViewController?
    var mapKitVC: MapKitViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewControllers = viewControllers {
            for vc in viewControllers {
                if let navigationVC = vc as? UINavigationController {
                    for vc in navigationVC.viewControllers {
                        if let restaurantListTableVC = vc as? RestaurantListTableViewController {
                            restaurantListTableVC.restaurantController = restaurantController
                            restaurantListTableVC.delegate = self
                            self.restaurantListTableVC = restaurantListTableVC
                        }
                        
                    }
                } else if let userInformationVC = vc as? UserInformationViewController {
                    userInformationVC.restaurantsController = restaurantController
                    self.userInformationVC = userInformationVC
                } else if let mapKitVC = vc as? MapKitViewController {
                    mapKitVC.restaurantsController = restaurantController
                    self.mapKitVC = mapKitVC
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if restaurantController.token == nil {
            self.performSegue(withIdentifier: "LoginViewControllerModalSegue", sender: self)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let loginVC = segue.destination as? LoginViewController {
            loginVC.restaurantsController = restaurantController
            
            if let restaurantListTableVC = restaurantListTableVC {
                loginVC.onComplete.append(restaurantListTableVC.tableView.reloadData)
            }
        }
        
    }
    

}

//MARK: - Add function for calculating overall rating below

extension TabBarViewController: RestaurantListTableViewControllerDelegate {
    
}
