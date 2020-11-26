//
//  FeedItemTests+CoreData.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
@testable import CNNFeed

final class FeedItemTests: XCTestCase {
    private let mockContext = MockDIContainer().context
    private let fakeItems = FakeFeedItems.firstCollection
    
    override func setUp() {
        super.setUp()
        saveAllFakeItems()
    }
    
    override func tearDown() {
        deleteAllFakeItems()
        super.tearDown()
    }
    
    func test_fetchFeedItem() throws {
        let fakeItem = try XCTUnwrap(fakeItems.first)
        
        let itemFetched = FeedItem.fetchFeedItem(title: fakeItem.title,
                                                 subtitle: fakeItem.subtitle,
                                                 publishedDate: fakeItem.publishedDate,
                                                 channel: fakeItem.channel,
                                                 originalLink: fakeItem.originalLink,
                                                 in: mockContext).first
        
        XCTAssertNotNil(itemFetched)
        XCTAssertEqual(itemFetched?.title, fakeItem.title)
        XCTAssertEqual(itemFetched?.subtitle, fakeItem.subtitle)
        XCTAssertEqual(itemFetched?.publishedDate, fakeItem.publishedDate)
        XCTAssertEqual(itemFetched?.channel, fakeItem.channel.rawValue)
        XCTAssertEqual(itemFetched?.originalLink, fakeItem.originalLink)
    }
    
    func test_avoidSavingTheSameItem() throws {
        saveFirstFakeItem()
        
        let fakeItem = try XCTUnwrap(fakeItems.first)
        let itemsFetched = FeedItem.fetchFeedItem(title: fakeItem.title,
                                                  subtitle: fakeItem.subtitle,
                                                  publishedDate: fakeItem.publishedDate,
                                                  channel: fakeItem.channel,
                                                  originalLink: fakeItem.originalLink,
                                                  in: mockContext)
        
        XCTAssertEqual(itemsFetched.count, 1, "We need to avoid saving the same item")
    }
    
    func test_delete() {
        deleteAllFakeItems()
        let items = fetchAllFakeItems()
        
        XCTAssertTrue(items.isEmpty)
    }
}

// MARK: - Helper functions
extension FeedItemTests {
    private func saveAllFakeItems() {
        fakeItems.forEach { fakeItem in
            FeedItem.saveFeedItem(title: fakeItem.title,
                                  subtitle: fakeItem.subtitle,
                                  publishedDate: fakeItem.publishedDate,
                                  channel: fakeItem.channel,
                                  originalLink: fakeItem.originalLink,
                                  in: mockContext)
        }
    }
    
    private func deleteAllFakeItems() {
        fakeItems.forEach { fakeItem in
            if let feedItem = FeedItem.fetchFeedItem(title: fakeItem.title,
                                                     subtitle: fakeItem.subtitle,
                                                     publishedDate: fakeItem.publishedDate,
                                                     channel: fakeItem.channel,
                                                     originalLink: fakeItem.originalLink,
                                                     in: mockContext).first {
                FeedItem.delete(feedItem: feedItem, in: mockContext)
            }
        }
    }
    
    private func saveFirstFakeItem() {
        if let fakeItem = fakeItems.first {
            FeedItem.saveFeedItem(title: fakeItem.title,
                                  subtitle: fakeItem.subtitle,
                                  publishedDate: fakeItem.publishedDate,
                                  channel: fakeItem.channel,
                                  originalLink: fakeItem.originalLink,
                                  in: mockContext)
        }
    }
    
    private func fetchAllFakeItems() -> [FeedItem] {
        var items = [FeedItem]()
        fakeItems.forEach { fakeItem in
            if let feedItem = FeedItem.fetchFeedItem(title: fakeItem.title,
                                                     subtitle: fakeItem.subtitle,
                                                     publishedDate: fakeItem.publishedDate,
                                                     channel: fakeItem.channel,
                                                     originalLink: fakeItem.originalLink,
                                                     in: mockContext).first {
                items.append(feedItem)
            }
        }
        return items
    }
}
