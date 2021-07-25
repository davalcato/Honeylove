//
//  InfoView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/25/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        // Scrollview
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center,
                   spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                // Text view
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Application").foregroundColor(Color.gray)
                    Spacer()
                    Text("honeylove")
                }
                
                // Text view for the credits
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Photos").foregroundColor(Color.gray)
                    Spacer()
                    Text("Unsplash")
                    
                }
                
                // Spacer between credit and dismiss button
                Spacer(minLength: 10)
                
                // Add button
                Button(action: {
                    // ACTION
                    print("Button was tapped!")
                }) {
                    Text("Continue".uppercased())
                    
                }
                
            }
                   .frame(minWidth: 0, maxWidth: .infinity)
                   .padding(.top, 15)
                   .padding(.bottom, 25)
                   .padding(.horizontal, 25)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
