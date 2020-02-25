//
//  AddCarViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit
import Foundation

class AddCarViewController: UIViewController, UINavigationControllerDelegate {

    //MARK: - Outlets
    @IBOutlet weak var carManufacturerTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carPriceTextField: UITextField!
    @IBOutlet weak var carImageVIew: UIImageView!
    
    var imagePicker: UIImagePickerController!

    enum ImageSource {
         case photoLibrary
         case camera
     }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    //MARK: - objc methods
    @objc func keyboardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else { return }
        
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + keyboardSize.height)
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    }
    
    @objc func keyboardDidHide(){
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    //MARK: - Actions
    @IBAction func didTappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        guard let manufacturer = carManufacturerTextField.text, let model = carModelTextField.text, let price = carPriceTextField.text else { return }
        guard !manufacturer.isEmpty, !model.isEmpty, !price.isEmpty else { return }
        
        if let image = carImageVIew.image {
            UserDefault.shared.image = image.pngData()!
        }
        UserDefault.shared.manufacturer = manufacturer
        UserDefault.shared.model = model
        UserDefault.shared.price = Int(price)!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "add"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedImageView(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
       //MARK: - Saving Image here
       @IBAction func save(_ sender: AnyObject) {
           guard let selectedImage = carImageVIew.image else {
               print("Image not found!")
               return
           }
           UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
       }

       //MARK: - Add image to Library
       @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
           if let error = error {
               // we got back an error!
               showAlertWith(title: "Save error", message: error.localizedDescription)
           } else {
               showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
           }
       }

       func showAlertWith(title: String, message: String){
           let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "OK", style: .default))
           present(ac, animated: true)
       }

}

 extension AddCarViewController: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        carImageVIew.image = selectedImage
    }
}
