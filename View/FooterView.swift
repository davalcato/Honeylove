//
//  FooterView.swift
//  Honeylove
//
//  Created by Daval Cato on 7/24/21.
//

import SwiftUI

struct FooterView: View {
    // MARK: Create new binder
    @Binding var showBookingAlert: Bool
    // Haptic feedback
    let haptics = UINotificationFeedbackGenerator()
    
    
    var body: some View {
        HStack {
            
            Button(action: {
                      print("button pressed")

                    }) {
            // Left image for the folder
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
                .accentColor(Color.white)
                }

            Spacer()
            
            // Button
            Button(action: {
                // ACTION
                playSound(sound: "Sound", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
                
        // Change property when button is tapped
                
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
            
            Button(action: {
                      print("button pressed")

                    }) {
        // Create new image on the right
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
                .accentColor(Color.white)
                }
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(
                width: 375,
                height: 80))
        
    }
}
