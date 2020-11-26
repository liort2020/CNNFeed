//
//  EndpointTests.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
@testable import CNNFeed

final class EndpointTests: XCTestCase {
    func test_baseAPI() {
        let baseAPI = Endpoint.baseAPI
        XCTAssertEqual(baseAPI, "http://rss.cnn.com/rss/edition_")
    }
    
    func test_defaultURL() {
        let defaultURL = Endpoint.defaultURL
        XCTAssertEqual(defaultURL, "https://edition.cnn.com/")
    }
    
    // MARK: URL Tests
    func test_travelURL() {
        let travelURL = Endpoint.travel.url
        XCTAssertNotNil(travelURL)
        XCTAssertEqual(travelURL?.relativeString, "http://rss.cnn.com/rss/edition_travel.rss")
    }
    
    func test_entertainmentURL() {
        let entertainmentURL = Endpoint.entertainment.url
        XCTAssertNotNil(entertainmentURL)
        XCTAssertEqual(entertainmentURL?.relativeString, "http://rss.cnn.com/rss/edition_entertainment.rss")
    }
    
    func test_sportURL() {
        let sportURL = Endpoint.sport.url
        XCTAssertNotNil(sportURL)
        XCTAssertEqual(sportURL?.relativeString, "http://rss.cnn.com/rss/edition_sport.rss")
    }
    
    // MARK: - Channel Tests
    func test_ConvertEndpointChannel_to_feedChannel() {
        XCTAssertEqual(Endpoint.travel.channel, FeedChannel.travel, "Cannot convert from travel Endpoint to travel FeedChannel")
        XCTAssertEqual(Endpoint.entertainment.channel, FeedChannel.entertainment, "Cannot convert from entertainment Endpoint to entertainment FeedChannel")
        XCTAssertEqual(Endpoint.sport.channel, FeedChannel.sport, "Cannot convert from sport Endpoint to sport FeedChannel")
    }
}
