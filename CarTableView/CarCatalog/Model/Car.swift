//
//  Car.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import Foundation
import UIKit

struct Car {
    
    let manufacturer: String
    let model: String
    let price: Int
    let image: UIImage
    
    init(manufacturer: String, model: String, price: Int, image: UIImage = UIImage(named: "noImage")!) {
        self.manufacturer = manufacturer
        self.model = model
        self.price = price
        self.image = image
    }
}
