//
//  WebView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @EnvironmentObject var feedViewModel: FeedViewModel
    @Binding var latestURL: URL?
    @Binding var latestTitle: String
    let feedItem: FeedItem?
    private let wkWebView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        if let feedItem = feedItem, let stringURL = feedItem.originalLink {
            let url = URL(string: stringURL)
            latestURL = url
            latestTitle = feedItem.title ?? ""
            return load(url: url)
        }
        
        guard let url = latestURL else {
            // We don't have a URL, we try to open the main CNN page
            return load(url: URL(string: Endpoint.defaultURL) ?? nil)
        }
        return load(url: url)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    private func load(url: URL?) -> WKWebView {
        guard let url = url else { return WKWebView() }
        
        let request = URLRequest(url: url)
        wkWebView.load(request)
        return wkWebView
    }
}
