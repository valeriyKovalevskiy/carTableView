//
//  SearchCarViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class SearchCarViewController: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switcher.isOn = !UserDefault.shared.isSorted
    }
    
    @IBAction func didTappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedSearchButton(_ sender: UIButton) {
        
        guard !UserDefault.shared.isSorted else { return }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sort"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sortFromMinToMax(_ sender: UISwitch) {
        UserDefault.shared.isSorted = !sender.isOn ? true : false
    }
}
