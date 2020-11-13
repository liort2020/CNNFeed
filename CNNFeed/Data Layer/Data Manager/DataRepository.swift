//
//  DataRepository.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine

protocol DataRepository {
    func fetchData(from url: URL, session: URLSession) -> AnyPublisher<Data?, Never>
}
