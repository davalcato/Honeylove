//
//  FooterView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/24/21.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            // Left image for the folder
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            // Button
            Button(action: {
                // ACTION
                print("Success!")
            }) {
                Text("Book Appointment".uppercased())
                // Modifiers to text view
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    
                )
            }
            
            Spacer()
            
        // Create new image on the right
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
            
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.fixed(
                width: 375,
                height: 80))
        
    }
}
