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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
    
    private func updateViews() {

        
    }
    
    @IBAction func signUpButtonePressed(_ sender: UIButton) {
        guard let username = userNameTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !password.isEmpty else { return }
        
        restaurantsController.signIn(username: username, password: password) { error in
            if error != nil {
                
               // DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Could not log in", message: "There was an error logging in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    NSLog("Error sign in did not work: \(error)")
               // }
            } else {
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    for callback in self.onComplete {
                        callback()
                    }
                }
                
            }
        }
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            return true
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
}


