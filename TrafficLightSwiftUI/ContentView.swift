//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Dymitr on 12.05.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var currentLight = CurrentLight.red
    @State private var redLight = 0.4
    @State private var yellowLight = 0.4
    @State private var greenLight = 0.4
    
    private func nextLight() {
        let lightIsOn = 1.0
        let lightIsOff = 0.1
        
        switch currentLight {
        case .red:
            greenLight = lightIsOff
            redLight = lightIsOn
            currentLight = CurrentLight.yellow
        case .yellow:
            redLight = lightIsOff
            yellowLight = lightIsOn
            currentLight = CurrentLight.green
        case .green:
            yellowLight = lightIsOff
            greenLight = lightIsOn
            currentLight = CurrentLight.red
        
        }
    }
}
extension ContentView {
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                ColorCircleView(color: .red, opacity: redLight)
                ColorCircleView(color: .yellow, opacity: yellowLight)
                ColorCircleView(color: .green, opacity: greenLight)
                
                Spacer()
                StartButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextLight()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
