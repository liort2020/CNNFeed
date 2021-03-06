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
    private var diContainer: DIContainerProtocol
    private let context: NSManagedObjectContext
    
    // Publishers
    private(set) var dataCancellables = [AnyCancellable]()
    
    // Timer
    private(set) var timer: Timer?
    private(set) var fetchingDataTimer = 5.0 // 5 seconds
    
    init(diContainer: DIContainerProtocol, context: NSManagedObjectContext) {
        self.diContainer = diContainer
        self.context = context
        
        startTimer()
    }
    
    func fetchData(completionHandler: @escaping () -> Void) {
        let dataManager = diContainer.dataManager
        
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
        dispatchGroup.notify(queue: .global()) {
            completionHandler()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: fetchingDataTimer, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.fetchData { }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
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
    
    deinit {
        stopTimer()
        dataCancellables.removeAll()
    }
}

fileprivate extension String {
    func fixWrongSubtitleContentFromXMLParser() -> String {
        components(separatedBy: "<").first ?? self
    }
}
