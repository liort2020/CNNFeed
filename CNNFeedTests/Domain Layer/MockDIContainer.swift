//
//  MockDIContainer.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import Foundation
import CoreData
@testable import CNNFeed

class MockDIContainer: DIContainerProtocol {
    // MARK: - Domain Layer
    lazy private(set) var feedUseCase = {
        FeedUseCase(diContainer: self, context: context)
    }()
    
    lazy private(set) var context: NSManagedObjectContext = {
        MockPersistenceController.shared.container.viewContext
    }()
    
    // MARK: - Data Layer
    lazy private(set) var feedItemsParser = {
        FeedItemsParser()
    }()
    
    let session = URLSession.shared
    
    lazy var dataManager: DataManager = {
        let mockDataRepository = MockDataRepository()
        return DataManager(using: mockDataRepository, session: session)
    }()
}
