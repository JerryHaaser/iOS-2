//
//  AddRestaurantViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit
import Photos

class AddRestaurantViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var restaurantNameTextfield: UITextField!
    @IBOutlet weak var cuisineTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var zipcodeTextfield: UITextField!
    @IBOutlet weak var stateTextfield: UITextField!
    var foodieFunController: FoodieFunController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func saveRestaurant(_ sender: UIBarButtonItem) {
        saveRestaurant()
    }
    
//MARK: - helper methods
    private func saveRestaurant() {
        guard let name = restaurantNameTextfield.text, !name.isEmpty,
        let cuisine = cuisineTextfield.text, !cuisine.isEmpty,
        let address = addressTextfield.text, !address.isEmpty,
        let city = cityTextfield.text, !city.isEmpty,
        let zipcode = zipcodeTextfield.text, !zipcode.isEmpty,
        let state = stateTextfield.text,!state.isEmpty else { return }
        
        foodieFunController?.createRestuarant(name: name, cuisine: cuisine, address: address, state: state, city: city, zipcode: zipcode)
        
        navigationController?.popViewController(animated: true)
    }
}
