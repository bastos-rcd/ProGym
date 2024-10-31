//
//  ProGymApp.swift
//  ProGym
//
//  Created by Bastien Record on 31/10/2024.
//

import SwiftUI

@main
struct ProGymApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
