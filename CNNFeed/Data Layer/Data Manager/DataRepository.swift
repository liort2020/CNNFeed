//
//  DataRepository.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine

protocol DataRepository {
//    var session: URLSession { get }
//    var queue: DispatchQueue { get }
//    var dispatchGroup: DispatchGroup { get }
    
    func fetchData(from url: URL, session: URLSession) -> AnyPublisher<Data?, Never>
//    func fetchData<T: Codable>(from dataURL: URL, session: URLSession) -> AnyPublisher<T, Error>
}
