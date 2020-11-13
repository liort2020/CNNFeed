//
//  ItemFeedView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct ItemFeedView: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @Binding var latestURL: URL?
    @Binding var latestTitle: String
    let feedItem: FeedItem
    
    var body: some View {
        NavigationLink(destination: WebView(latestURL: $latestURL, latestTitle: $latestTitle, feedItem: feedItem).environmentObject(feedViewModel)) {
            VStack(alignment: .leading) {
                if !title.isEmpty {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, titleBottomPadding)
                }
                
                if !publishedDate.isEmpty {
                    Text(publishedDate)
                        .font(.caption)
                        .padding(.bottom, publishedDateBottomPadding)
                }
                
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    private var title: String {
        feedItem.title ?? ""
    }
    
    private var publishedDate: String {
        feedItem.publishedDate ?? ""
    }
    
    private var subtitle: String {
        feedItem.subtitle ?? ""
    }
    
    // MARK: - Constants
    private let titleBottomPadding: CGFloat = 1
    private let publishedDateBottomPadding: CGFloat = 4
}

struct ItemFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFeedView(latestURL: Binding.constant(nil), latestTitle: Binding.constant(""), feedItem: FeedItem())
    }
}
