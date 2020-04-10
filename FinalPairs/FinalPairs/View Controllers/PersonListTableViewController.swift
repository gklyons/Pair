//
//  PersonListTableViewController.swift
//  FinalPairs
//
//  Created by Garrett Lyons on 4/10/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

import UIKit

class PersonListTableViewController: UITableViewController {

    // MARK: - Properties
    var pairs: [[Person]]?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        randomize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        randomize()
        tableView.reloadData()
    }

    // MARK: - Actions
    @IBAction func shuffleButtonTapped(_ sender: Any) {
        randomize()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Name", message: "Add a name to the pairs list!", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter name here..."
            textField.autocapitalizationType = .words
            textField.autocorrectionType = .no
        }
        let cancelAction = UIAlertAction(title: "Opps! ABORT!!!", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let name = alertController.textFields?.first?.text, !name.isEmpty else {
                self.present(alertController, animated: true)
                return
            }
            PersonController.sharedInstance.add(name: name)
            self.randomize()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return pairs?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Group \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pairs?[section].count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let student = pairs?[indexPath.section][indexPath.row]
        cell.textLabel?.text = student?.name

        return cell
    }


 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let person = pairs?[indexPath.section][indexPath.row]
                else { return }
            pairs?[indexPath.section].remove(at: indexPath.row)
            PersonController.sharedInstance.delete(person: person)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    // MARK: - Helper Functions
    func randomize() {
        pairs = PersonController.sharedInstance.pairs()
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? PersonDetailViewController else { return }
            destinationVC.person = pairs?[indexPath.section][indexPath.row]
        }
        
    }
    

}
