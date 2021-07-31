//
//  CardView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/23/21.
//

import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - PROPERTIES
    
    let id = UUID()
    var honeylove: Destination
    
    var body: some View {
        Image(honeylove.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
        //Declare the frame for your image
//            .frame(width: 380, height: 280)
            .frame(minWidth: 0, maxWidth: .infinity)
        // Honeylove place destination
            .overlay(
                VStack(alignment: .center,
                       spacing: 12) {
                Text(honeylove.place.uppercased())
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .shadow(radius: 1)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 4)
                    .overlay(
                        Rectangle()
                            .fill(Color.white)
                            .frame(height:1),
                        alignment: .bottom
                    
                    )
                
                Text(honeylove.country.uppercased())
                    .foregroundColor(Color.black)
                // Capsule shape under the text view
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(minWidth: 85)
                    .padding(.horizontal, 10)
                    .padding(.vertical,5)
                    .background(
                        Capsule().fill(Color.white)
                    
                    
                    
                    )
                
            }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                alignment: .bottom
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        // Present the honeylove destination in preview
        CardView(honeylove: honeyloveData[0])
            .previewLayout(.fixed(width: 275,
                                  height: 600))
        
    }
}
