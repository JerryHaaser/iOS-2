//
//  AddRestaurantItemViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit
import Photos

class AddRestaurantItemViewController: UIViewController {
  
    @IBOutlet weak var addRestaurantItemMenuItemNameTextField: UITextField!
    @IBOutlet weak var addRestaurantMenuItemPriceTextField: UITextField!
    @IBOutlet weak var addRestaurantMenuItemReviewTextView: UITextView!
    @IBOutlet weak var addRestaurantMenuItemRatingTextField: UITextField!
    @IBOutlet weak var addRestaurantMenuItemImageView: UIImageView!
    
    let imageName = "profile.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addRestaurantMenuItemSaveButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addRestaurantMenuItemUploadPhotoButton(_ sender: UIButton) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                guard status == .authorized else {
                    NSLog("User did not authorize access to the photo library")
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
        
        let image = addRestaurantMenuItemImageView.image!
        let data = image.pngData()
        
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
    func loadImage(imageName: String) {
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            addRestaurantMenuItemImageView.image = UIImage(contentsOfFile: imagePath)
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

extension AddRestaurantItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        addRestaurantMenuItemImageView.image = image
        
        saveImage(imageName: imageName)
        
        updateViews()
    }
}
