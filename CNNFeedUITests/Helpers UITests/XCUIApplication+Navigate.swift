//
//  XCUIApplication+Navigate.swift
//  CNNFeedUITests
//
//  Created by Lior Tal on 26/11/2020.
//

import XCTest

extension XCUIApplication {
    func navigateToView(identifier id: String) {
        let button = buttons.matching(identifier: id).firstMatch
        button.tap()
    }
    
    func openNextPage() {
        let button = buttons.matching(identifier: SharedNames.openNextPageButtonId.rawValue).firstMatch
        button.tap()
    }
}
