//
//  WelcomeView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @State var latestURL: URL?
    @State var latestTitle: String = ""
    
    // FeedTabView sheet
    @State var showFeedTabView = false
    
    // WebView sheet
    @State var showWebView = false
    
    // Timer
    @State var timeRemaining = Date().dateToShow()
    private var timer = Timer.publish(every: oneMinuteTimeInterval, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(timeRemaining)
                    .onReceive(timer) { _ in
                        timeRemaining = Date().dateToShow()
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .accessibilityIdentifier(timeRemainingTextId)
                
                Spacer()
                
                Button {
                    showWebView = true
                } label: {
                    Text(latestTitle)
                        .lineLimit(nil)
                }
                .padding(.horizontal, latestTitleHorizontalPadding)
                .sheet(isPresented: $showWebView) {
                    WebView(latestURL: $latestURL, latestTitle: $latestTitle, feedItem: nil)
                        .environmentObject(feedViewModel)
                }
                .accessibilityIdentifier(latestTitleButtonId)
                
                Spacer()
                
                Button {
                    showFeedTabView = true
                } label: {
                    Text(openNextPageTitle)
                }
                .sheet(isPresented: $showFeedTabView) {
                    FeedTabView(latestURL: $latestURL, latestTitle: $latestTitle)
                        .environment(\.managedObjectContext, viewContext)
                        .environmentObject(feedViewModel)
                }
                .accessibilityIdentifier(openNextPageButtonId)
                
                Spacer()
            }
            .navigationBarTitle(welcomeNavigationBarTitle)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
    
    // MARK: Constants
    private let welcomeNavigationBarTitle = "Welcome"
    private let openNextPageTitle = "Open Next Page"
    private let latestTitleHorizontalPadding: CGFloat = 10
    // Timer
    private static let oneMinuteTimeInterval: TimeInterval = 60 // 1 minute
    
    // MARK: View Accessibility IDs
    private let timeRemainingTextId = "timeRemainingId"
    private let openNextPageButtonId = "openNextPageButtonId"
    private let latestTitleButtonId = "latestTitleButtonId"
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(FeedViewModel(diContainer: DIContainer()))
    }
}
