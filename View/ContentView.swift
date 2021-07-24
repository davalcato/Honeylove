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
        VStack {
            HeaderView()
            
            Spacer()
            
            CardView(honeylove: honeyloveData[2])
            // FIXME: Add temporary padding to cardview
                .padding()
            
            Spacer()
            
            FooterView()
            
            // Spacer between card 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
