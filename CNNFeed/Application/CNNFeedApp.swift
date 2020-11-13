//
//  CNNFeedApp.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

@main
struct CNNFeedApp: App {
    private let persistenceController = PersistenceController.shared
    private let diContainer = DIContainer()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(FeedViewModel(diContainer: diContainer))
        }
    }
}
