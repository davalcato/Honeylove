//
//  GuideView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/24/21.
//

import SwiftUI

struct GuideView: View {
    // MARK: - PROPERTIES dismis sheet view w/ custom button
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
            
        // Header component
            HeaderComponent()
            
            Spacer(minLength: 10)
            
            
            Text("Get Started!")
                .fontWeight(.black)
                .modifier(TitleModifier())
            
            // Marketing Headline
            Text("Discover and pick the perfect spiritual guide to you direct you to world of love!")
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 10)
            
            VStack(alignment: .leading, spacing: 25) {
                GuideComponent(
                    title: "Like",
                    subtitle: "Swipe",
                    description: "Do you like this description of love? Then swipe right. It will be saved to the favourites ",
                    icon: "heart.circle")
                
                GuideComponent(
                    title: "Dismiss",
                    subtitle: "Swipe left",
                    description: "Would you like to skip this photo? Then swipe left to remove.",
                    icon: "xmark.circle")
                
                GuideComponent(
                    title: "Book",
                    subtitle: "Tap the button",
                    description: "There is a number of resort selection to choice from.",
                    icon: "checkmark.square")
            }
            
            Spacer(minLength: 10)
            
            Button(action: {
                // ACTION
//                print("A button was tapped.")
                
                // Dismiss when button is tapped
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Text("Continue".uppercased())
                    .modifier(ButtonModifier())
                }
            
            }
        // Basic modifiers
        .frame(minWidth: 0,
               maxWidth: .infinity)
        .padding(.top, 15)
        .padding(.bottom, 25)
        .padding(.horizontal, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
