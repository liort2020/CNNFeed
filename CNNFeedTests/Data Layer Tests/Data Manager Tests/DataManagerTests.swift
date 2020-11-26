//
//  DataManagerTests.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
import Combine
@testable import CNNFeed

final class DataManagerTests: XCTestCase {
    private var dataManager: DataManager?
    private var subscriber: AnyCancellable?
    
    override func setUp() {
        super.setUp()
        dataManager = MockDIContainer().dataManager
    }
    
    override func tearDown() {
        dataManager = nil
        subscriber = nil
        super.tearDown()
    }
    
    func test_fetchData() throws {
        let fetchDataExpectation = expectation(description: "dataManagerFetchData")
        let publisher = dataManager?.fetchData(from: try XCTUnwrap(FakeNetworkData.url))
        
        subscriber = try XCTUnwrap(publisher).sink { dataReceived in
            XCTAssertNotNil(dataReceived)
            XCTAssertEqual(dataReceived, FakeNetworkData.data)
            fetchDataExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
}
