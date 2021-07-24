//
//  ContentView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    // Card view text
        CardView(honeylove: honeyloveData[1])
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
