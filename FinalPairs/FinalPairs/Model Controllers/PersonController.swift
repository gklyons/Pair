//
//  PersonController.swift
//  FinalPairs
//
//  Created by Garrett Lyons on 4/10/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

import CoreData

class PersonController {
    
    // MARK: - Properties & Shared Instance
    static var sharedInstance = PersonController()
    
    var people: [Person] {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    // MARK: - CRUD
    func add() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    func randomizeNames() {
        
    }
    
    // MARK: - Data Persistence
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("Error! I ran into a problem at the persistent store... Sorry, couldn't save! \(error.localizedDescription)")
        }
    }
}

