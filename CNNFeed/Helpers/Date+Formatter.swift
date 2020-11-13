//
//  Date+Formatter.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import Foundation

extension Date {
    func dateToShow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd/MM/yyyy h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.locale = .current
        return dateFormatter.string(from: self)
    }
}
