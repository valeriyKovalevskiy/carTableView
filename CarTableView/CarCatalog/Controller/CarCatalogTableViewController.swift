//
//  TableViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit
import Foundation


//protocol AddCarProtocol {
//    func addCar(manufacturer: String, model: String, price: Int)
//}

class CarCatalogTableViewController: UITableViewController {
    
    var carsCatalog = [Car]()
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        configureNavigationBarItems()
        
        carsCatalog = GetCarsCatalog.getCars()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortList), name: NSNotification.Name(rawValue: "sort"), object: nil)

    }

    private func registerTableViewCell() {
        let nib = UINib(nibName: "CarCatalogCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CarCatalogCell")
    }
    
    private func configureNavigationBarItems() {
        navigationItem.leftBarButtonItem = editButtonItem
        
        let add = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        let search = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItems = [add, search]
    }
    
    @objc func searchButtonTapped() {
        let storyboard = UIStoryboard(name: "SearchCarViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SearchCarViewController") as! SearchCarViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func addButtonTapped() {
        let storyboard = UIStoryboard(name: "AddCarViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddCarViewController") as! AddCarViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func loadList(){
        car = Car(manufacturer: UserDefault.shared.manufacturer, model: UserDefault.shared.model, price: UserDefault.shared.price)
        carsCatalog.append(car!)
        self.tableView.reloadData()
    }
    
    @objc func sortList(){
        carsCatalog.sort { $0.price < $1.price }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsCatalog.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCatalogCell", for: indexPath) as! CarCatalogCell

        cell.carManufacturerLabel.text = carsCatalog[indexPath.row].manufacturer
        cell.carModelLabel.text = carsCatalog[indexPath.row].model
        cell.carPriceLabel.text = String(carsCatalog[indexPath.row].price)

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carsCatalog.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CarInfoViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CarInfoViewController") as? CarInfoViewController
        let selectedRow = indexPath.row
        vc?.titleLabelText = carsCatalog[selectedRow].manufacturer
        vc?.carModelText = carsCatalog[selectedRow].model
        vc?.carPriceText = String(carsCatalog[selectedRow].price)
//        vc?.carImage = carsCatalog[selectedRow].
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

//extension CarCatalogTableViewController: AddCarProtocol {
//
//    func addCar(manufacturer: String, model: String, price: Int) {
//        car = Car(manufacturer: manufacturer, model: model, price: price)
//        carsCatalog.append(car!)
//        tableView.reloadData()
//    }
//}
