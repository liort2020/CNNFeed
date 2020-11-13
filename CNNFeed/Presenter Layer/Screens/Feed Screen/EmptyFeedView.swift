//
//  EmptyFeedView.swift
//  CNNFeed
//
//  Created by Lior Tal on 12/11/2020.
//

import SwiftUI

struct EmptyFeedView: View {
    var body: some View {
        Text(noItemsFondMessage)
            .foregroundColor(.secondary)
    }
    
    // MARK: - Constants
    private let noItemsFondMessage = "There Are No Items Yet"
}

struct EmptyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFeedView()
    }
}
