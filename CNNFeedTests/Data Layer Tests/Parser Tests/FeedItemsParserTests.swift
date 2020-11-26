//
//  FeedItemsParserTests.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
@testable import CNNFeed

final class FeedItemsParserTests: XCTestCase {
    private var parser: FeedItemsParser?
    
    override func setUp() {
        super.setUp()
        parser = FeedItemsParser()
    }
    
    func test_decode() throws {
        guard let channels: [CNNChannelModel] = parser?.decode(using: FakeNetworkData.data) else {
            XCTFail("Cannot decode fake data to CNNChannelModel array")
            return
        }
        
        XCTAssertTrue(!channels.isEmpty, "We need to get one channel")
        let items = channels.first?.items
        XCTAssertEqual((try XCTUnwrap(items)).count, 2, "We need to get two items")
    }
    
    func test_decodeEmptyData() throws {
        let emptyData = "".data(using: .utf8)
        let channels: [CNNChannelModel]? = parser?.decode(using: try XCTUnwrap(emptyData))
        
        XCTAssertNil(channels, "We should not be able to parse an empty data")
    }
    
    func testPerformance_decodeXML() throws {
        guard let parser = parser else { return }
        self.measure {
            // Measure the time to decode XML
            let _: [CNNChannelModel]? = parser.decode(using: FakeNetworkData.data)
        }
    }
}
