//
//  DIContainer.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import CoreData

protocol DIContainerProtocol {
    // MARK: - Domain Layer
    var feedUseCase: FeedUseCase { get }
    var context: NSManagedObjectContext { get }
    
    // MARK: - Data Layer
    var session: URLSession { get }
    var feedItemsParser: FeedItemsParser { get }
    var dataManager: DataManager { get }
}

class DIContainer: DIContainerProtocol {
    // MARK: - Domain Layer
    lazy private(set) var feedUseCase = {
        FeedUseCase(diContainer: self, context: context)
    }()
    
    lazy private(set) var context = {
        PersistenceController.shared.container.viewContext
    }()
    
    // MARK: - Data Layer
    lazy private(set) var feedItemsParser = {
        FeedItemsParser()
    }()
    
    let session = URLSession.shared
    
    lazy var dataManager: DataManager = {
        let defaultDataRepository = DefaultDataRepository()
        return DataManager(using: defaultDataRepository, session: session)
    }()
}
