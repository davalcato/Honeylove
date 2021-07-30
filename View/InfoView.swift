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
                
                AppInfoView()
                
                // Text view for the credits
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                // Spacer between credit and dismiss button
                Spacer(minLength: 10)
                
                // Add button
                Button(action: {
                    // ACTION
                    print("Button was tapped!")
                }) {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                    
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

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10) {
            RowAppInfoView(ItemOne: "Application",
                           ItemTwo: "Honeylove")
            
            RowAppInfoView(ItemOne: "Compatibility",
                           ItemTwo: "iPhone and iPad")
            
            RowAppInfoView(ItemOne: "Developer",
                           ItemTwo: "John / Jane")
            
            RowAppInfoView(ItemOne: "Designer",
                           ItemTwo: "Daval Cato")
            
            RowAppInfoView(ItemOne: "Website",
                           ItemTwo: "Mesoftware.com")
            
            RowAppInfoView(ItemOne: "Version",
                           ItemTwo: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
    // MARK: PROPERIES
    var ItemOne: String
    var ItemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(ItemOne).foregroundColor(Color.gray)
                Spacer()
                Text(ItemTwo)
            }
            // Add new divider after HStack
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10) {
            HStack {
                Text("Photos").foregroundColor(Color.gray)
                Spacer()
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photographers").foregroundColor(Color.gray)
            
            Text("Producer”, “Senior/Junior Producer”, “Supervisor”, “Associate Producer”, “Production Coordinator”, “Project Management/Assistance”, “Game/Development Director”, “Project Leader/Manager”, “Production Manager”)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
