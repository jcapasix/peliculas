//
//  CoreDataStack.swift
//  Data
//
//  Created by Jordan Capa on 16/11/24.
//

import CoreData

class MovieCoreDataStack {
    
    static let shared = MovieCoreDataStack()
    
    private let identifier: String = "com.jcapasix.DataMovie"
    private let model: String = "CoreDataModel"
    
    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
        guard let messageKitBundle = Bundle(identifier: self.identifier),
              let modelURL = messageKitBundle.url(forResource: self.model, withExtension: "momd"),
              let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("❌ Fallo al localizar CoreDataModel.")
        }
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel)
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("❌ Fallo al intentar pesistir el modelo: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
