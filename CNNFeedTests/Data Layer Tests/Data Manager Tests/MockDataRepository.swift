//
//  MockDataRepository.swift
//  CNNFeedTests
//
//  Created by Lior Tal on 25/11/2020.
//

import Foundation
import Combine
@testable import CNNFeed

final class MockDataRepository: DataRepository {
    private let publisherMillisecondsDelay = 10
    
    func fetchData(from dataURL: URL, session: URLSession) -> AnyPublisher<Data?, Never> {
        Just(FakeNetworkData.data)
            .delay(for: .milliseconds(publisherMillisecondsDelay), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
