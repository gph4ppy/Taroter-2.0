//
//  Persistence.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2022.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Taroter")

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
