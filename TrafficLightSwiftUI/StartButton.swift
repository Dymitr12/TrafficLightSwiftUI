//
//  StartButton.swift
//  TrafficLightSwiftUI
//
//  Created by Dymitr on 13.05.2022.
//

import SwiftUI

struct StartButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(24)
        .overlay(RoundedRectangle(cornerRadius: 24)
        .stroke(Color.white, lineWidth: 4))
    }
}

struct StartColorButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(title: "START", action: {})
    }
}
