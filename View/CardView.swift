//
//  CardView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/23/21.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let id = UUID()
    var honeylove: Destination
    var body: some View {
        Image(honeylove.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(honeylove: honeyloveData[1])
            .previewLayout(.fixed(width: 375,
                                  height: 600))
        
    }
}
