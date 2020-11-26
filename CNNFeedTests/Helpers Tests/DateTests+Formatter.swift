//
//  DateTests+Formatter.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
@testable import CNNFeed

final class DateTests: XCTestCase {
    func test_dateToShow() {
        let timeInterval = TimeInterval(1606311545.000968)
        let currentDate = Date(timeIntervalSince1970: timeInterval)
        let dateToShow = currentDate.dateToShow()
        
        XCTAssertEqual(dateToShow, "Wednesday 25/11/2020 3:39 PM")
    }
    
    func testPerformance_dateToShow() throws {
        let currentDate = Date()
        self.measure {
            // Measure the time to create a date to show
            let _ = currentDate.dateToShow()
        }
    }
}
