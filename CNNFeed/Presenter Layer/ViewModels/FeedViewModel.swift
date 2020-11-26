//
//  FeedViewModel.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation

class FeedViewModel: ObservableObject {
    private var diContainer: DIContainerProtocol
    
    init(diContainer: DIContainerProtocol) {
        self.diContainer = diContainer
        fetchData { }
    }
    
    func fetchData(completionHandler: @escaping () -> Void) {
        diContainer.feedUseCase.fetchData {
            completionHandler()
        }
    }
}
