//
//  LoginViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signUpSignInSegmentedControl: UISegmentedControl!
    
    var restaurantsController: RestaurantController!
    
    var onComplete: [( () -> Void )] = []
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func updateViews() {

        
    }
    
    @IBAction func signUpButtonePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpSignInSegmentedControlTouched(_ sender: UISegmentedControl) {
        switch signUpSignInSegmentedControl.selectedSegmentIndex
        {
        case 0:
            emailAddressLabel.isHidden = false
            emailAddressTextField.isHidden = false
            cityLabel.isHidden = false
            cityTextField.isHidden = false
            stateLabel.isHidden = false
            stateTextField.isHidden = false
            signUpButton.titleLabel?.text = "Sign Up"
        case 1:
            emailAddressLabel.isHidden = true
            emailAddressTextField.isHidden = true
            cityLabel.isHidden = true
            cityTextField.isHidden = true
            stateLabel.isHidden = true
            stateTextField.isHidden = true
            signUpButton.titleLabel?.text = "Sign In"
        default:
            break;
        }
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

