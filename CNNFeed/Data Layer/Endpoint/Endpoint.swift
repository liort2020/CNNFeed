//
//  Endpoint.swift
//  CNNFeed
//
//  Created by Lior Tal on 13/11/2020.
//

import Foundation

enum Endpoint: CaseIterable {
    case travel
    case entertainment
    case sport
    
    static let baseAPI = "http://rss.cnn.com/rss/edition_"
    static let defaultURL = "https://edition.cnn.com/"
}

extension Endpoint {
    var url: URL? {
        switch self {
        case .travel:
            return URL(string: Self.baseAPI + "travel.rss") ?? nil
        case .entertainment:
            return URL(string: Self.baseAPI + "entertainment.rss") ?? nil
        case .sport:
            return URL(string: Self.baseAPI + "sport.rss") ?? nil
        }
    }
    
    var channel: FeedChannel {
        switch self {
        case .travel:
            return .travel
        case .entertainment:
            return .entertainment
        case .sport:
            return .sport
        }
    }
}
