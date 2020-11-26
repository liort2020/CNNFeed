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
        var stringURL = ""
        switch self {
        case .travel:
            stringURL = Self.baseAPI + "travel.rss"
        case .entertainment:
            stringURL = Self.baseAPI + "entertainment.rss"
        case .sport:
            stringURL = Self.baseAPI + "sport.rss"
        }
        
        guard !stringURL.isEmpty, let url = URL(string: stringURL) else { return nil }
        return url
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
