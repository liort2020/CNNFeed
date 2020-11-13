//
//  FeedViewModel.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation

class FeedViewModel: ObservableObject {
    private let diContainer: DIContainer
    
    init(diContainer: DIContainer) {
        self.diContainer = diContainer
        diContainer.feedUseCase.fetchData()
    }
}
