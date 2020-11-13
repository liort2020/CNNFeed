//
//  DataManager.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine

class DataManager {
    private var dataRepository: DataRepository
    private var session: URLSession
    
    init(using dataRepository: DataRepository, session: URLSession) {
        self.dataRepository = dataRepository
        self.session = session
    }
    
    func fetchData(from url: URL) -> AnyPublisher<Data?, Never> {
        dataRepository.fetchData(from: url, session: session)
    }
}
