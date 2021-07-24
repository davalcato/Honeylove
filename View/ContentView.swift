//
//  ContentView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/23/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    
    @State var showAlert: Bool = false
    
    
    var body: some View {
    // Card view text
        VStack {
            HeaderView()
            
            Spacer()
            
            CardView(honeylove: honeyloveData[2])
            // FIXME: Add temporary padding to cardview
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
            // Spacer between card
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"),
                  message: Text("The best destination for finding love!"),
                  dismissButton: .default(Text("Happy Honeylove!")))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
