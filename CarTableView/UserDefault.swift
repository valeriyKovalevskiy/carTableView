//
//  UserDefaults.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import Foundation

class UserDefault {
    
    static let shared = UserDefault()

    var manufacturer: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "manufacturer")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "manufacturer")!
        }
    }
    
    var model: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "model")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "model")!
        }
    }
}



