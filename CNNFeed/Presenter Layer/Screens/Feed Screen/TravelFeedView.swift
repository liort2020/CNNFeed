//
//  TravelFeedView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct TravelFeedView: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [],
                  predicate: NSPredicate(format: "channel = %@", FeedChannel.travel.rawValue),
                  animation: .default) private var feedItems: FetchedResults<FeedItem>
    
    private let columns = Array(repeating: GridItem(), count: numberOfGridColumns)
    @Binding var latestURL: URL?
    @Binding var latestTitle: String
    
    var body: some View {
        if !feedItems.isEmpty {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(feedItems) { item in
                        ItemFeedView(latestURL: $latestURL, latestTitle: $latestTitle, feedItem: item)
                            .padding()
                            .background(Color.random())
                            .cornerRadius(feedItemCornerRadius)
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
        } else {
            EmptyFeedView()
        }
    }
    
    // MARK: - Constants
    private static let numberOfGridColumns = 2
    private let horizontalPadding: CGFloat = 5
    private let feedItemCornerRadius: CGFloat = 8
}

struct TravelFeedView_Previews: PreviewProvider {
    static var previews: some View {
        TravelFeedView(latestURL: Binding.constant(nil), latestTitle: Binding.constant(""))
    }
}
