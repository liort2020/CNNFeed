//
//  FeedTabView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct FeedTabView: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var latestURL: URL?
    @Binding var latestTitle: String
    
    var body: some View {
        TabView {
            // MARK: Tab 1
            NavigationView {
                TravelFeedView(latestURL: $latestURL, latestTitle: $latestTitle)
                    .navigationBarTitle(travelFeedTabTitle)
            }
            .tabItem {
                Image(systemName: travelFeedTabIcon)
                Text(travelFeedTabTitle)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            // MARK: Tab 2
            NavigationView {
                SportAndEntertainmentFeedView(latestURL: $latestURL, latestTitle: $latestTitle)
                    .navigationBarTitle(sportAndEntertainmentTabTitle)
            }
            .tabItem {
                Image(systemName: sportAndEntertainmentTabIcon)
                Text(sportAndEntertainmentTabTitle)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    // MARK: - Constants
    // Tabs Titles
    private let travelFeedTabTitle = "Travels"
    private let sportAndEntertainmentTabTitle = "Sport and Entertainment"
    // Tabs Icons
    private let travelFeedTabIcon = "airplane"
    private let sportAndEntertainmentTabIcon = "sportscourt.fill"
}

struct FeedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTabView(latestURL: Binding.constant(nil), latestTitle: Binding.constant(""))
    }
}
