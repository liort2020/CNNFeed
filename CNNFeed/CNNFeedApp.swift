//
//  CNNFeedApp.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

@main
struct CNNFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
