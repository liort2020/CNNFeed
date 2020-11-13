//
//  FeedItem+CoreData.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import CoreData

enum FeedChannel: String {
    case travel
    case entertainment
    case sport
}

extension FeedItem {
    // MARK: - Save
    static func saveFeedItem(title: String?, subtitle: String?, publishedDate: String?, channel: FeedChannel, originalLink: String?, in context: NSManagedObjectContext) {
        context.performAndWait() {
            if let _ = fetchFeedItem(title: title,
                                     subtitle: subtitle,
                                     publishedDate: publishedDate,
                                     channel: channel,
                                     originalLink: originalLink,
                                     in: context).first {
                // We have this item in our CoreData storage
                return
            }
            
            let feedItem = FeedItem(context: context)
            feedItem.id = UUID()
            feedItem.title = title
            feedItem.subtitle = subtitle
            feedItem.publishedDate = publishedDate
            feedItem.channel = channel.rawValue
            feedItem.originalLink = originalLink
            
            do {
                try context.save()
            } catch let error {
                print("CoreData error saving: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Fetch
    static func fetchFeedItem(title: String?, subtitle: String?, publishedDate: String?, channel: FeedChannel, originalLink: String?, in context: NSManagedObjectContext) -> [FeedItem] {
        let request = NSFetchRequest<FeedItem>(entityName: "FeedItem")
        
        // Predicates
        var predicates = [NSPredicate]()
        predicates.append(NSPredicate(format: "channel == %@", channel.rawValue))
        if let title = title {
            predicates.append(NSPredicate(format: "title == %@", title))
        }
        if let subtitle = subtitle {
            predicates.append(NSPredicate(format: "subtitle == %@", subtitle))
        }
        if let publishedDate = publishedDate {
            predicates.append(NSPredicate(format: "publishedDate == %@", publishedDate))
        }
        if let originalLink = originalLink {
            predicates.append(NSPredicate(format: "originalLink == %@", originalLink))
        }
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        var feedItems = [FeedItem]()
        do {
            feedItems = try context.fetch(request)
        } catch let error {
            print("CoreData error fetching: \(error.localizedDescription)")
        }
        return feedItems
    }
    
    // MARK: - Delete
    static func delete(feedItem: FeedItem, in context: NSManagedObjectContext) {
        context.performAndWait() {
            context.delete(feedItem)
            do {
                try context.save()
            } catch let error {
                print("CoreData error deleting: \(error.localizedDescription)")
            }
        }
    }
}
