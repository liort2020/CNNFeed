//
//  CNNChannelModel.swift
//  CNNFeed
//
//  Created by Lior Tal on 13/11/2020.
//

import Foundation

struct CNNChannelModel: Codable {
    private(set) var items: [CNNFeedItem]?
    
    enum CodingKeys: String, CodingKey {
        case items = "item"
    }
    
    struct CNNFeedItem: Codable {
        private(set) var title: String?
        private(set) var subtitle: String?
        private(set) var publishedDate: String?
        private(set) var originalLink: String?
        
        enum CodingKeys: String, CodingKey {
            case title
            case subtitle = "description"
            case publishedDate = "pubDate"
            case originalLink = "feedburner:origLink"
        }
    }
}
