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
    // Store binding for button
    @State var showGuide: Bool = false
    // Storing the value state of Info button 
    @State var showInfo: Bool = false
    
    // MARK: - CARD VIEWS
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeylove: honeyloveData[index]))
            }
        return views
    }()
    
    // MARK: TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            
            return false
        }
        // Find out the index of each card
        return index == 0
    }
    
    var body: some View {
    // Card view text
        VStack {
            // MARK: HEADER
            HeaderView(showGuideView: $showGuide,
                       showInfoView: $showInfo)
            
            Spacer()
        
            // MARK: CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)


            Spacer()
            
            // MARK: - FOOTER
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
