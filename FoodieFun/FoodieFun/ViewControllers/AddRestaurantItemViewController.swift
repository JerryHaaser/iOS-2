//
//  AddRestaurantItemViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class AddRestaurantItemViewController: UIViewController {
  
    @IBOutlet weak var addRestaurantItemMenuItemNameTextField: UITextField!
    
    @IBOutlet weak var addRestaurantMenuItemPriceTextField: UITextField!
    @IBOutlet weak var addRestaurantMenuItemReviewTextView: UITextView!
    @IBOutlet weak var addRestaurantMenuItemRatingTextField: UITextField!
    
    @IBOutlet weak var addRestaurantMenuItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addRestaurantMenuItemSaveButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func addRestaurantMenuItemUploadPhotoButton(_ sender: UIButton) {
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
