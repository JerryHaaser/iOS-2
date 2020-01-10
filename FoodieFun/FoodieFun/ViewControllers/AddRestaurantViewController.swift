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
    
    @IBOutlet weak var addRestaurantNameTextField: UITextField!
    @IBOutlet weak var addRestaurantCuisineTextField: UITextField!
    @IBOutlet weak var addRestaurantStreetAddressTextField: UITextField!
    @IBOutlet weak var addRestaurantCityTextField: UITextField!
    @IBOutlet weak var addRestaurantStateTextField: UITextField!
    @IBOutlet weak var addRestaurantImageView: UIImageView!
    
    var restaurantController: RestaurantController?
    var user: User?
    
// Not sure what this does, may have to change
    let imageName = "profile.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addRestaurantSaveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let name = addRestaurantNameTextField.text,
            let cuisine = addRestaurantCuisineTextField.text,
            let address = addRestaurantStreetAddressTextField.text,
            let city = addRestaurantCityTextField.text,
            let state = addRestaurantStateTextField.text else { return }
        
//        let dateFormatter = DateFormatter()
//        let formatedDate = DateFormatter.date
//        if let date = formatedDate {
//            restaurantController?.createRestaurant(city, cuisine: cuisine, id: user?.id, restaurantName: name, restaurantRating: <#T##Float#>, restaurantReview: <#T##String#>, state: state, streetAddress: address, userId: user?.id, visitDate: date, zip: zip)
//        }
        
    }
    @IBAction func addRestaurantUploadAPhotoButtonPressed(_ sender: UIButton) {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                guard status == .authorized else {
                    NSLog("User did not authorized access to the photoLibrary")
                    return
                }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func updateViews() {
        loadImage(imageName: imageName)
    }
    
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = addRestaurantImageView.image!
        let data = image.pngData()
        
        fileManager.createFile(atPath: imagePath, contents: data, attributes: nil)
    }
    
    func loadImage(imageName: String) {
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            addRestaurantImageView.image = UIImage(contentsOfFile: imagePath)
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

extension AddRestaurantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        addRestaurantImageView.image = image
        
        saveImage(imageName: imageName)
        
        updateViews()
    }
}
