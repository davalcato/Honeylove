//
//  HeaderView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/24/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            // Create left bottom of header
            Button(action: {
                // Action
                print("Information")
                
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            // Between the two elements
            Spacer()
            
            Image("honeylove")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            // Create buttom on the right side
            Button(action: {
                // Action
                print("Guide")
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
        // Resize the layout in preview
            .previewLayout(.fixed(
                width: 375,
                height: 80))
    }
}
