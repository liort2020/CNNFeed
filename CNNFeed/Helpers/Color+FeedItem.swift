//
//  Color+FeedItem.swift
//  CNNFeed
//
//  Created by Lior Tal on 13/11/2020.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        let uiColor = UIColor(red: .randomNumber(), green: .randomNumber(), blue: .randomNumber(), alpha: 0.1)
        return Color(uiColor)
    }
}

fileprivate extension CGFloat {
    static func randomNumber() -> CGFloat {
        CGFloat.random(in: 0...1)
    }
}
