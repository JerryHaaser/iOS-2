//
//  AddRestaurantViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UIViewController {
    
    @IBOutlet weak var addRestaurantNameTextField: UITextField!
    @IBOutlet weak var addRestaurantCuisineTextField: UITextField!
    @IBOutlet weak var addRestaurantStreetAddressTextField: UITextField!
    @IBOutlet weak var addRestaurantCityTextField: UITextField!
    @IBOutlet weak var addRestaurantStateTextField: UITextField!
    @IBOutlet weak var addRestaurantImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addRestaurantSaveButtonPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func addRestaurantUploadAPhotoButtonPressed(_ sender: UIButton) {
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
