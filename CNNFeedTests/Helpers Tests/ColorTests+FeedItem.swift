//
//  ColorTests+FeedItem.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import XCTest
import SwiftUI
@testable import CNNFeed

final class ColorTests: XCTestCase {
    func test_randomColor() {
        let randomColor1 = Color.random()
        let randomColor2 = Color.random()
        
        XCTAssertNotEqual(randomColor1, randomColor2, "We need to get different colors by a random function")
    }
    
    func testPerformance_randomColor() throws {
        self.measure {
            // Measure the time to create a random color
            let _ = Color.random()
        }
    }
}
