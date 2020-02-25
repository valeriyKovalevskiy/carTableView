//
//  UserDefaults.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import Foundation

class UserDefault {
    
    static var shared = UserDefault()

    var isSorted: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "isSorted")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "isSorted")
        }
    }
    
    var switcherIsActive: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "switcherIsActive")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "switcherIsActive")
        }
    }
    
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
    
    var price: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: "price")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.integer(forKey: "price")
        }
    }
    
    var image: Data {
        set {
            UserDefaults.standard.set(newValue, forKey: "image")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.object(forKey: "image") as! Data
        }
    }

}



