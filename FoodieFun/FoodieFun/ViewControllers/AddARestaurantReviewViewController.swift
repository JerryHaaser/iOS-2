//
//  AddARestaurantReviewViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class AddARestaurantReviewViewController: UIViewController {
    
    @IBOutlet weak var addARestaurantReviewTitleTextField: UITextField!
    
    @IBOutlet weak var addARestaurantReviewReviewTextView: UITextView!
    @IBOutlet weak var addARestaurantReviewServiceTextView: UITextView!
    @IBOutlet weak var addARestaurantReviewTimeToSeatingTextField: UITextField!
    
    @IBOutlet weak var addARestaurantRatingTextField: UITextField!
    
    var restaurantController: RestaurantController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
