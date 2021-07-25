//
//  TitleModifier.swift
//  Honeylove
//
//  Created by Daval Cato on 7/25/21.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
