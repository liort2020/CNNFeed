//
//  FeedItemsParser.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation
import XMLCoder

class FeedItemsParser {
    private let xmlDecoder = XMLDecoder()
    
    func decode<T: Codable>(using data: Data) -> T? {
        guard !data.isEmpty else { return nil }
        return try? xmlDecoder.decode(T.self, from: data)
    }
}
