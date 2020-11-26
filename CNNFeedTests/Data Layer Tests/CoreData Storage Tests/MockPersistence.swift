//
//  MockPersistence.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import Foundation
@testable import CNNFeed

struct MockPersistenceController {
    static let shared = PersistenceController(inMemory: true)
    let container = shared.container
    
    private init() { }
}
