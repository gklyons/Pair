//
//  CoreDataStack.swift
//  FinalPairs
//
//  Created by Garrett Lyons on 4/10/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    static var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PairRandomizer")
        container.loadPersistentStores { (store, error) in
            if let error = error as NSError? {
                print("ERROR loading from persistent store: Double back to CDS file.")
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    // MARK: - CoreData Persistence
    static func saveMOC() {
        let context = CoreDataStack.context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

