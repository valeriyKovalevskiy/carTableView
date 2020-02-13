//
//  TableViewController.swift
//  CarTableView
//
//  Created by Valeriy Kovalevskiy on 2/13/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class CarCatalogTableViewController: UITableViewController {
    
    var manufactures = ["dfs", "asd", "hf", "etr"]
    var models = ["corolla", "carina", "aventus", "pukanus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()
        configureNavigationBarItems()
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return manufactures.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCatalogCell", for: indexPath) as! CarCatalogCell

        cell.carManufacturerLabel.text = manufactures[indexPath.row]
        cell.carModelLabel.text = models[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manufactures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
