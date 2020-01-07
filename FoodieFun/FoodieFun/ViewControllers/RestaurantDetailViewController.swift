//
//  RestaurantDetailViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantDetailVCReviewTextView: UITextView!
    @IBOutlet weak var restaurantDetailVCServiceReviewTextView: UITextView!
    @IBOutlet weak var restaurantDetailVCTimeInMinutesLabel: UILabel!
    @IBOutlet weak var restaurantDetailVCRatingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restaurantDetailVCEditButton(_ sender: UIBarButtonItem) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
