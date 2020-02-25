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
    
    //MARK: - Constants
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Properties
    var car: Car?
    var carsCatalog = [Car]()
    var filteredCarsCatalog = [Car]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
        configureNavigationBarItems()
        registerTableViewCell()
        addObservers()
        
        carsCatalog = GetCarsCatalog.getCars()
    }
    
    //MARK: - Private methods
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func configureNavigationBarItems() {
        navigationItem.leftBarButtonItem = editButtonItem
        
        let add = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        let sort = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItems = [add, sort]
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "CarCatalogCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CarCatalogCell")
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(addCars), name: NSNotification.Name(rawValue: "add"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortCars), name: NSNotification.Name(rawValue: "sort"), object: nil)

    }
    
    //MARK: - Objc methods
    @objc func sortButtonTapped() {
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
    
    @objc func addCars(){
        car = Car(manufacturer: UserDefault.shared.manufacturer, model: UserDefault.shared.model, price: UserDefault.shared.price, image: UIImage(data: UserDefault.shared.image)!)
        carsCatalog.append(car!)
        self.tableView.reloadData()
    }
    
    @objc func sortCars(){
        carsCatalog.sort { $0.price < $1.price }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredCarsCatalog.count : carsCatalog.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCatalogCell", for: indexPath) as! CarCatalogCell
        var cellData: Car
        if isFiltering {
            cellData = filteredCarsCatalog[indexPath.row]
        } else {
            cellData = carsCatalog[indexPath.row]
        }
        cell.carImageView.image = cellData.image
        cell.carManufacturerLabel.text = cellData.manufacturer
        cell.carModelLabel.text = cellData.model
        cell.carPriceLabel.text = String(cellData.price)

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
        vc?.carImage = carsCatalog[selectedRow].image
        self.navigationController?.pushViewController(vc!, animated: true)
    }


}

//MARK: - Extensions
extension CarCatalogTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            print("UISearchBar.text cleared!")
        }
    }
}

extension CarCatalogTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        filterContentForSearchText(text)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredCarsCatalog = carsCatalog.filter({ $0.manufacturer.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}
