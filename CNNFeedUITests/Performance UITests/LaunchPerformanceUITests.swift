//
//  LaunchPerformanceUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class LaunchPerformanceUITests: XCTestCase {
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
