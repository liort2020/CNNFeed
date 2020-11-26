//
//  FakeFeedItems.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import Foundation
@testable import CNNFeed

struct FakeFeedItems {
    static var firstCollection: [FakeItem] = {
        var items = [FakeItem]()
        for index in 0..<10 {
            let publishedDate = Calendar.current.date(byAdding: .day, value: index, to: Date())
            items.append(FakeItem(title: "test_title_\(index)",
                                      subtitle: "test_subtitle_\(index)",
                                      publishedDate: publishedDate?.dateToShow(),
                                      channel: FeedChannel.allCases.randomElement() ?? .travel,
                                      originalLink: "test_url_\(index)")
            )
        }
        return items
    }()
    
    static var secondCollection: [FakeItem] = {
        var items = [FakeItem]()
        items.append(FakeItem(title: "The $550 million megayacht concept that looks like a shark ",
                                  subtitle: "Just weeks after unveiling an upcoming yacht concept that resembles a swan, Lazzarini Design Studio are pushing the boundaries even further with a brand new design that\'s shaped like a shark.",
                                  publishedDate: "Wed, 25 Nov 2020 11:07:01 GMT",
                                  channel: .travel,
                                  originalLink: "https://www.cnn.com/travel/article/new-superyacht-shaped-like-a-shark/index.html"))
        
        items.append(FakeItem(title: "A Hollywood dialect coach explains why accents go wrong",
                                  subtitle: "How does an Irishman screw up an Irish accent, like in the movie \"Wild Mountain Thyme\"? Dialect coach Jack Wallace says it\'s easier than you might think.",
                                  publishedDate: "Mon, 23 Nov 2020 14:56:45 GMT",
                                  channel: .travel,
                                  originalLink: "https://www.cnn.com/videos/travel/2020/11/20/wild-mountain-thyme-accents-travel-orig.cnn"))
        return items
    }()
    
    struct FakeItem {
        let title: String?
        let subtitle: String?
        let publishedDate: String?
        let channel: FeedChannel
        let originalLink: String?
    }
}
