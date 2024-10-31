import SwiftUI
import CoreData

@main
struct ProGymApp: App {
	let persistenceContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "ProGym")
		container.loadPersistentStores { description, error in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		return container
	}()
	
	var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(
					\.managedObjectContext,
					 persistenceContainer.viewContext
				)
        }
    }
}
