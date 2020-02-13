//
//  CarCatalogCell.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class CarCatalogCell: UITableViewCell {

    @IBOutlet weak var carManufacturerLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
