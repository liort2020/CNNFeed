//
//  WebViewUITests.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

class WebViewUITests: XCTestCase {
    private var application: XCUIApplication?
    
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application?.launch()
        application?.openNextPage()
        
        let feedItemView = application?.scrollViews.element.firstMatch.buttons.firstMatch
        feedItemView?.tap()
    }
    
    func test_loadWebView() throws {
        let app = try XCTUnwrap(application)
        let webView = app.webViews.firstMatch
        
        XCTAssert(webView.exists, "The WebView did not load")
    }
    
    func test_checkEmptyWebViewNavigationBar() throws {
        let app = try XCTUnwrap(application)
        let webViewNavigationBar = app.navigationBars.firstMatch
        
        XCTAssert(webViewNavigationBar.title.isEmpty, "The WebView navigation bar has a title")
    }
}
