import SwiftUI

@main
struct ProGymApp: App {
	let persistenceController = PersistenceController.shared
	
	var body: some Scene {
        WindowGroup {
            HomeView()
				.environment(
					\.managedObjectContext,
					 persistenceController.container.viewContext
				)
        }
	}
}
