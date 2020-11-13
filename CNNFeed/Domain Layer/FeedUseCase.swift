//
//  FeedUseCase.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine
import CoreData

class FeedUseCase {
    private var diContainer: DIContainer
    private let context: NSManagedObjectContext
    
    // Publishers
    private var dataCancellables = [AnyCancellable]()
    
    // Timer
    private let fetchingDataTimer = 5.0 // 5 seconds
    
    init(diContainer: DIContainer, context: NSManagedObjectContext) {
        self.diContainer = diContainer
        self.context = context
        
        startTimer()
    }
    
    func fetchData() {
        guard let dataManager = diContainer.dataManager else { return }
        
        let dispatchGroup = DispatchGroup()
        Endpoint.allCases.forEach {
            guard let url = $0.url else { return }
            
            dispatchGroup.enter()
            let channel = $0.channel
            
            let publisher = dataManager.fetchData(from: url)
            let cancellable = publisher.sink { [weak self] data in
                guard let self = self, let data = data, !data.isEmpty else { return }
                self.parseAndSaveItemFeeds(using: data, channel: channel)
                dispatchGroup.leave()
            }
            
            dataCancellables.append(cancellable)
        }
        dispatchGroup.notify(queue: .global()) { }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: fetchingDataTimer, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.fetchData()
        }
    }
    
    private func parseAndSaveItemFeeds(using data: Data, channel: FeedChannel) {
        guard let channels: [CNNChannelModel] = diContainer.feedItemsParser.decode(using: data),
              let items = channels.first?.items
        else { return }
        
        items.forEach {
            saveFeedItem(from: $0, channel: channel)
        }
    }
    
    private func saveFeedItem(from cnnFeedItem: CNNChannelModel.CNNFeedItem, channel: FeedChannel) {
        FeedItem.saveFeedItem(title: cnnFeedItem.title,
                              subtitle: cnnFeedItem.subtitle?.fixWrongSubtitleContentFromXMLParser(),
                              publishedDate: cnnFeedItem.publishedDate,
                              channel: channel,
                              originalLink: cnnFeedItem.originalLink,
                              in: context)
    }
}

fileprivate extension String {
    func fixWrongSubtitleContentFromXMLParser() -> String {
        components(separatedBy: "<").first ?? self
    }
}
