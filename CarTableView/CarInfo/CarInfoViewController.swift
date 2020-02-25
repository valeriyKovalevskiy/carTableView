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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fillLabels()
        fillImageView()
        configureNavigationBarItems()
    }
    
    //MARK: - Private methods
    private func fillLabels() {
        carTitleLabel.text = titleLabelText
        carModelLabel.text = carModelText
        carPriceLabel.text = carPriceText
    }
    
    private func fillImageView() {
        carImageView.image = carImage
    }
    
    private func configureNavigationBarItems() {
        let share = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItem = share
    }
    
    //MARK: - Objc methods
    @objc func shareButtonTapped() {
        let image = carImageView.image
        let text = carTitleLabel.text! + " " + carModelLabel.text! //сюда можно докидать текста
        let elementsToShare = [text, image! ] as [Any]
        let activityViewController = UIActivityViewController(activityItems: elementsToShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

    
}
