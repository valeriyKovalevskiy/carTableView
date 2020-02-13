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
    
    init(manufacturer: String, model: String) {
        self.manufacturer = manufacturer
        self.model = model
    }
}
