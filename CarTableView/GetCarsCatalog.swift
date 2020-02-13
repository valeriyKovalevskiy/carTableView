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
        cars.append(Car(manufacturer: "Toyota", model: "Corolla"))
        cars.append(Car(manufacturer: "Toyota", model: "Carina"))
        cars.append(Car(manufacturer: "Toyota", model: "Prius"))
        cars.append(Car(manufacturer: "BMW", model: "123"))
        cars.append(Car(manufacturer: "BMW", model: "456"))
        cars.append(Car(manufacturer: "BMW", model: "789"))
        cars.append(Car(manufacturer: "Ford", model: "1234"))
        cars.append(Car(manufacturer: "Ford", model: "5678"))
        cars.append(Car(manufacturer: "Ford", model: "9012"))
        cars.append(Car(manufacturer: "Ferrari", model: "3456"))
        cars.append(Car(manufacturer: "Ferrari", model: "7890"))
        cars.append(Car(manufacturer: "Ferrari", model: "6543"))
        
        return cars
    }
}

