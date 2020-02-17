//
//  CarInfoViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/14/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class CarInfoViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var carTitleLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!

    //MARK: - Properties
    var titleLabelText: String?
    var carModelText: String?
    var carPriceText: String?
    var carImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carTitleLabel.text = titleLabelText
        carModelLabel.text = carModelText
        carPriceLabel.text = carPriceText
        carImageView.image = UIImage(named: "noImage")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
