//
//  WelcomViewUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class WelcomViewUITests: XCTestCase {
    private var application: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application?.launch()
    }
    
    func test_timeRemainingNotEmpty() throws {
        let app = try XCTUnwrap(application)
        let timeRemainingElement = app.staticTexts.matching(identifier: SharedNames.timeRemainingTextId.rawValue).firstMatch
        
        XCTAssertFalse(timeRemainingElement.label.isEmpty)
    }
    
    func test_navigationBar() throws {
        let app = try XCTUnwrap(application)
        let welcomeNavigationBar = app.navigationBars[SharedNames.welcomeNavigationBarTitle.rawValue]
        
        XCTAssert(welcomeNavigationBar.exists, "The welcome navigation bar does not exist")
    }
    
    func test_checkOpenNextPageButtonTitle() throws {
        let app = try XCTUnwrap(application)
        let buttonTitle = app.staticTexts.matching(identifier: SharedNames.timeRemainingTextId.rawValue).firstMatch
        XCTAssert(buttonTitle.exists, "The open next page button title does not exist")
    }
    
    func test_tap_openNextPageButton() throws {
        let app = try XCTUnwrap(application)
        let button = app.buttons.matching(identifier: SharedNames.openNextPageButtonId.rawValue).firstMatch
        let travelNavigationBar = app.navigationBars[SharedNames.travelFeedTabTitle.rawValue]
        
        XCTAssertFalse(travelNavigationBar.exists)
        button.tap()
        XCTAssert(travelNavigationBar.exists, "The travel navigation bar does not exist")
    }
    
    func test_checkLatestButton_doesNotExistAtLaunch() throws {
        let app = try XCTUnwrap(application)
        let button = app.staticTexts.matching(identifier: SharedNames.latestTitleButtonId.rawValue).firstMatch
        XCTAssertFalse(button.exists, "The latest button title does exist")
    }
}
