//
//  FeedViewModelTests.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest
@testable import CNNFeed

final class FeedViewModelTests: XCTestCase {
    private let mockDIContainer = MockDIContainer()
    private var feedViewModel: FeedViewModel?
    
    override func setUp() {
        super.setUp()
        feedViewModel = FeedViewModel(diContainer: mockDIContainer)
    }
    
    override func tearDown() {
        feedViewModel = nil
        super.tearDown()
    }
    
    func test_fetchData() {
        let feedViewModelFetchData = expectation(description: "feedViewModel_fetchData")
        
        // MARK: Step 1: Load fake data and save to in-memory storage
        feedViewModel?.fetchData {
            feedViewModelFetchData.fulfill()
        }
        waitForExpectations(timeout: 30)
        
        // MARK: Step 2: Check if we have data in in-memory storage
        let fetchFeedItem = expectation(description: "feedViewModel_fetchFeedItem")
        // For two fake items
        fetchFeedItem.expectedFulfillmentCount = 2
        
        FakeFeedItems.secondCollection.forEach { fakeItem in
            let itemFetched = FeedItem.fetchFeedItem(title: fakeItem.title,
                                                     subtitle: fakeItem.subtitle,
                                                     publishedDate: fakeItem.publishedDate,
                                                     channel: fakeItem.channel,
                                                     originalLink: fakeItem.originalLink,
                                                     in: mockDIContainer.context).first
            
            XCTAssertNotNil(itemFetched)
            fetchFeedItem.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
