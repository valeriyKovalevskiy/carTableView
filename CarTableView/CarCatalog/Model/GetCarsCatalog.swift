//
//  GetCarsCatalog.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import Foundation

struct GetCarsCatalog {
    private init() {}
    
    static func getCars() -> [Car] {
        var cars = [Car]()
        cars.append(Car(manufacturer: "Toyota", model: "Corolla", price: 1000))
        cars.append(Car(manufacturer: "Toyota", model: "Carina", price: 4000))
        cars.append(Car(manufacturer: "Toyota", model: "Prius", price: 5000))
        cars.append(Car(manufacturer: "BMW", model: "X5", price: 5423))
        cars.append(Car(manufacturer: "BMW", model: "e39", price: 6831))
        cars.append(Car(manufacturer: "BMW", model: "X7", price: 1120))
        cars.append(Car(manufacturer: "Ford", model: "Mustang", price: 66101))
        cars.append(Car(manufacturer: "Ford", model: "Focus", price: 65421))
        cars.append(Car(manufacturer: "Ford", model: "Mondeo", price: 6532))
        cars.append(Car(manufacturer: "Mercedes", model: "S65", price: 4311))
        cars.append(Car(manufacturer: "Mercedes", model: "S211", price: 8763))
        cars.append(Car(manufacturer: "Mercedes", model: "GLE 450", price: 15000))
        
        return cars
    }
}

