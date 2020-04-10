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
    
    func pairs() -> [[Person]] {
        let randomized = people.shuffled()
        var singlePair = [Person]()
        var multiplePairs = [[Person]]()
        for person in randomized {
            if singlePair.count == 0 {
                singlePair.append(person)
            } else {
                singlePair.append(person)
                multiplePairs.append(singlePair)
                singlePair = [Person]()
            }
        }
        if singlePair.count != 0 {
            multiplePairs.append(singlePair)
        }
        return multiplePairs
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

