//
//  FeedTabViewUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class FeedTabViewUITests: XCTestCase {
    private var application: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application?.launch()
        application?.openNextPage()
    }
    
    func test_travelNavigationBar() throws {
        let app = try XCTUnwrap(application)
        let travelNavigationBar = app.navigationBars[SharedNames.travelFeedTabTitle.rawValue]
        
        XCTAssert(travelNavigationBar.exists, "The travel navigation bar does not exist")
    }
    
    func test_travelTab_existsAndSelected() throws {
        let app = try XCTUnwrap(application)
        let travelTab = app.tabBars.buttons[SharedNames.travelFeedTabTitle.rawValue]
        
        XCTAssert(travelTab.exists)
        XCTAssert(travelTab.isSelected)
    }
    
    func test_sportAndEntertainmentTab_existsAndNotSelected() throws {
        let app = try XCTUnwrap(application)
        let sportAndEntertainmentTab = app.tabBars.buttons[SharedNames.sportAndEntertainmentTabTitle.rawValue]
        
        XCTAssert(sportAndEntertainmentTab.exists)
        XCTAssertFalse(sportAndEntertainmentTab.isSelected)
    }
    
    func test_sportAndEntertainmentNavigationBar() throws {
        let app = try XCTUnwrap(application)
        let sportAndEntertainmentTab = app.tabBars.buttons[SharedNames.sportAndEntertainmentTabTitle.rawValue]
        
        sportAndEntertainmentTab.tap()
        let sportAndEntertainmentNavigationBar = app.navigationBars[SharedNames.sportAndEntertainmentTabTitle.rawValue]
        
        XCTAssert(sportAndEntertainmentNavigationBar.exists, "The sport and Entertainment navigation bar does not exist")
    }
    
    func test_sportAndEntertainment_selectedTab() throws {
        let app = try XCTUnwrap(application)
        let travelTab = app.tabBars.buttons[SharedNames.travelFeedTabTitle.rawValue]
        let sportAndEntertainmentTab = app.tabBars.buttons[SharedNames.sportAndEntertainmentTabTitle.rawValue]
        
        XCTAssertFalse(sportAndEntertainmentTab.isSelected)
        XCTAssert(travelTab.isSelected)
        
        sportAndEntertainmentTab.tap()
        
        XCTAssert(sportAndEntertainmentTab.isSelected)
        XCTAssertFalse(travelTab.isSelected)
    }
}
