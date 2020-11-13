//
//  SportAndEntertainmentFeedView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct SportAndEntertainmentFeedView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var latestURL: URL?
    @Binding var latestTitle: String
    
    // We used ascending=false to show World Sport items before Entertainment items
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FeedItem.channel, ascending: false)],
                  predicate: NSPredicate(format: "channel = %@ OR channel = %@", FeedChannel.sport.rawValue, FeedChannel.entertainment.rawValue),
                  animation: .default) private var feedItems: FetchedResults<FeedItem>
    
    var body: some View {
        if !feedItems.isEmpty {
            List {
                ForEach(feedItems) { item in
                    ItemFeedView(latestURL: $latestURL, latestTitle: $latestTitle, feedItem: item)
                        .listRowBackground(Color.random())
                }
            }
        } else {
            EmptyFeedView()
        }
    }
}

struct SportAndEntertainmentFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SportAndEntertainmentFeedView(latestURL: Binding.constant(nil), latestTitle: Binding.constant(""))
    }
}
