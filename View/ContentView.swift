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
    // Gesture
    @GestureState private var dragState = DragState.inactive
    // DRAG THRESHOLD
    private var dragAreaThreshold: CGFloat = 65.0
    
    
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
    // MARK: DRAG STATES
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    var body: some View {
    // Card view text
        VStack {
            // MARK: HEADER
            HeaderView(showGuideView: $showGuide,
                       showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
        
            // MARK: CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                    // Overlay modifier
                        .overlay(
                            ZStack {
                            // X -MARK SYMBOL
                            Image(systemName: "x.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            
                            // HEART SYMBOL
                            Image(systemName: "heart.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                    
                        .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
                    // Scale down card
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12)  : 0))
                    
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                    
                    
                    // Gesture Modifiers
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState,
                                              body: { (value, state, transaction) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                                
                            }
                            
                        })
                    )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            
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
