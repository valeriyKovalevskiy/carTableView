//
//  AddCarViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit
import Foundation

class AddCarViewController: UIViewController {

    @IBOutlet weak var carManufacturerTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carPriceTextField: UITextField!
    
//    var delegate: AddCarProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        guard let manufacturer = carManufacturerTextField.text, let model = carModelTextField.text, let price = carPriceTextField.text else { return }
        guard !manufacturer.isEmpty, !model.isEmpty, !price.isEmpty else { return }
        
        UserDefault.shared.manufacturer = manufacturer
        UserDefault.shared.model = model
        UserDefault.shared.price = Int(price)!
//        delegate?.addCar(manufacturer: manufacturer, model: model, price: UserDefault.shared.price)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}

