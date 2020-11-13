//
//  DefaultDataRepository.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine

class DefaultDataRepository: DataRepository {
    func fetchData(from dataURL: URL, session: URLSession) -> AnyPublisher<Data?, Never> {
        let urlRequest = URLRequest(url: dataURL)
        
        return session.dataTaskPublisher(for: urlRequest)
            .map { (data, response) in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      !data.isEmpty else { return nil }
                return data
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
