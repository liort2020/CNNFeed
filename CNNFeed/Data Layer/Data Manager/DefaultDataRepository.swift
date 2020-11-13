//
//  DefaultDataRepository.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import Combine

class DefaultDataRepository: DataRepository {
//    var queue = DispatchQueue(label: "data_queue")
//    var dispatchGroup = DispatchGroup()
    
//    func fetchData(session: URLSession) -> [AnyPublisher<(Data, FeedChannel)?, Never>] {
//        var publishers = [AnyPublisher<(Data, FeedChannel)?, Never>]()
//
//        Endpoint.allCases.forEach {
//            guard let url = $0.url else { return }
//
//            dispatchGroup.enter()
//            let urlRequest = URLRequest(url: url)
//            let channel = $0.channel
//
//            let publisher = session.dataTaskPublisher(for: urlRequest)
//                .map { (data, response) -> (Data, FeedChannel)? in
//                    guard let response = response as? HTTPURLResponse,
//                          response.statusCode == 200,
//                          !data.isEmpty else { return nil }
//
//
//
//                    self.dispatchGroup.leave()
//                    return (data, channel)
//                }
//                .replaceError(with: nil)
//                .eraseToAnyPublisher()
//
//            publishers.append(publisher)
//        }
//
//        dispatchGroup.notify(queue: .global()) {
////            return publishers
//        }
//
////        let urlRequest = URLRequest(url: dataURL)
//
//
//
//    }
//}
    
    
    func fetchData(from dataURL: URL, session: URLSession) -> AnyPublisher<Data?, Never> {
        let urlRequest = URLRequest(url: dataURL)

//        session.dataTask(with: urlRequest) { (data, response, error) in
//            print("😃1")
//            print(error)
//            print(data)
//            print("😃2")
//
//        }.resume()



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




// TODO: - Add status code to http!!!
