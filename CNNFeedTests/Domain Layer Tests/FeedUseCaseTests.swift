//
//  FeedUseCaseTests.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
@testable import CNNFeed

final class FeedUseCaseTests: XCTestCase {
    private let mockDIContainer = MockDIContainer()
    private weak var feedUseCase: FeedUseCase?
    
    override func setUp() {
        super.setUp()
        feedUseCase = mockDIContainer.feedUseCase
    }
    
    override func tearDown() {
        feedUseCase = nil
        super.tearDown()
    }
    
    func test_fetchData() {
        // MARK: Step 1: Load fake data and save to in-memory storage
        let fetchDataExpectation = expectation(description: "feedUseCaseFetchData")
        feedUseCase?.fetchData {
            fetchDataExpectation.fulfill()
        }
        waitForExpectations(timeout: 30)
        
        // MARK: Step 2: Fetch fake data from in-memory storage
        let fetchFeedItem = expectation(description: "fetchFeedItem")
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
            XCTAssertEqual(itemFetched?.title, fakeItem.title)
            XCTAssertEqual(itemFetched?.subtitle, fakeItem.subtitle)
            XCTAssertEqual(itemFetched?.publishedDate, fakeItem.publishedDate)
            XCTAssertEqual(itemFetched?.channel, fakeItem.channel.rawValue)
            XCTAssertEqual(itemFetched?.originalLink, fakeItem.originalLink)
            fetchFeedItem.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func test_stopTimer() throws {
        let timer = try XCTUnwrap(feedUseCase?.timer)
        
        XCTAssertTrue(timer.isValid)
        feedUseCase?.stopTimer()
        XCTAssertFalse(timer.isValid)
    }
}
