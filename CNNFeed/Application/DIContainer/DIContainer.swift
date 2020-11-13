//
//  DIContainer.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation

class DIContainer {
    // MARK: - Domain Layer
    lazy private(set) var feedUseCase = {
        FeedUseCase(diContainer: self, context: context)
    }()
    
    lazy private var context = {
        PersistenceController.shared.container.viewContext
    }()
    
    // MARK: - Data Layer
    let session = URLSession.shared
    
    lazy private(set) var feedItemsParser = {
        FeedItemsParser()
    }()
    
    lazy var dataManager: DataManager? = {
        let defaultDataRepository = DefaultDataRepository()
        return DataManager(using: defaultDataRepository, session: session)
    }()
}
