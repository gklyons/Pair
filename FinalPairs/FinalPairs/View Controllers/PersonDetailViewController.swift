//
//  PersonDetailViewController.swift
//  FinalPairs
//
//  Created by Garrett Lyons on 4/10/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    // MARK: - Properties
    var person: Person?
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var personNameTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person {
            personNameTextField.text = person.name
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        personNameTextField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let newName = personNameTextField.text, !newName.isEmpty,
            let person = person else { return }
        
        PersonController.sharedInstance.update(person: person, name: newName)
        navigationController?.popViewController(animated: true)
    }
    
    
}
