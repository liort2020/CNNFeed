//
//  ItemFeedViewUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class ItemFeedViewUITests: XCTestCase {
    private var application: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application?.launch()
        application?.openNextPage()
    }
    
    func test_checkIfFeedItemViewHasContent() throws {
        let app = try XCTUnwrap(application)
        let feedItemView = app.scrollViews.element.firstMatch.buttons.firstMatch
        let cells = feedItemView.cells.staticTexts
        
        XCTAssertFalse(cells.firstMatch.exists, "We have ItemFeedView cell with no content")
    }
}
