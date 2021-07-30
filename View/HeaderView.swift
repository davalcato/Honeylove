//
//  HeaderView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/24/21.
//

import SwiftUI

struct HeaderView: View {
    // MARK: PROPERTIES
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    
    var body: some View {
        HStack {
            // Create left bottom of header
            Button(action: {
                // Action
//                print("Information")
                
                // Show view property
                self.showInfoView.toggle()
                
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            // Create a sheet
            .sheet(isPresented: $showInfoView) {
               InfoView()
            }
            
            // Between the two elements
            Spacer()
            
            Image("honeylove")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            // Create buttom on the right side
            Button(action: {
                // ACTION: ShowGuideView when tapped
                
//                print("Guide")
                self.showGuideView.toggle()
                
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            // Add new sheet to button
            .sheet(
                isPresented: $showGuideView) {
                GuideView()
                
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    // Static variable for preview
    @State static var showGuide: Bool = false
    // Create preview
    @State static var showInfo: Bool = false
    
    
    static var previews: some View {
        // Add the Propery
        HeaderView(showGuideView: $showGuide,
                   showInfoView: $showInfo)
        // Resize the layout in preview
            .previewLayout(.fixed(
                width: 375,
                height: 80))
    }
}
