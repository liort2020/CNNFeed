//
//  TravelFeedViewUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class TravelFeedViewUITests: XCTestCase {
    private var application: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application?.launch()
        application?.openNextPage()
    }
    
    func test_checkThatItemFeedViewsAreDisplayed() throws {
        let app = try XCTUnwrap(application)
        let numberOfItems = app.scrollViews.element.buttons.count
        
        XCTAssert(numberOfItems > 0, "We have no items in this view")
    }
}
