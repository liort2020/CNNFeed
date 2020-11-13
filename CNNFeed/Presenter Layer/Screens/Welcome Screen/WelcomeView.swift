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
    @State var timeRemaining = Date().dateToShow()
    
    // WebView sheet
    @State var showWebView = false
    
    private let timer = Timer.publish(every: oneMinuteTimeInterval, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(fullName)
                    .font(.largeTitle)
                
                Spacer()
                
                Text(timeRemaining)
                    .onReceive(timer) { _ in
                        timeRemaining = Date().dateToShow()
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                
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
                
                Spacer()
            }
            .navigationBarTitle(welcomeNavigationBarTitle)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: Constants
    private let welcomeNavigationBarTitle = "Welcome"
    private let fullName = "Lior Tal"
    private let openNextPageTitle = "Open Next Page"
    private let latestTitleHorizontalPadding: CGFloat = 10
    // Timer
    private static let oneMinuteTimeInterval: TimeInterval = 60 // 1 minute
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(FeedViewModel(diContainer: DIContainer()))
    }
}
