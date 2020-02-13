//
//  TableViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit
import Foundation

class CarCatalogTableViewController: UITableViewController {
    
    var carsCatalog = [Car]()
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()
        configureNavigationBarItems()
        
        carsCatalog = GetCarsCatalog.getCars()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

    }

    private func registerTableViewCell() {
        let nib = UINib(nibName: "CarCatalogCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CarCatalogCell")
    }
    
    private func configureNavigationBarItems() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
    }
    
    @objc func addButtonTapped() {
        let storyboard = UIStoryboard(name: "AddCarViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddCarViewController") as! AddCarViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func loadList(){
        car = Car(manufacturer: UserDefault.shared.manufacturer, model: UserDefault.shared.model)
        carsCatalog.append(car!)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsCatalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCatalogCell", for: indexPath) as! CarCatalogCell

        cell.carManufacturerLabel.text = carsCatalog[indexPath.row].manufacturer
        cell.carModelLabel.text = carsCatalog[indexPath.row].model
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carsCatalog.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
