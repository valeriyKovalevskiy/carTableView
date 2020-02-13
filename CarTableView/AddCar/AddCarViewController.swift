//
//  AddCarViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController {

    @IBOutlet weak var addCarManufacturerTextField: UITextField!
    @IBOutlet weak var addCarModelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

