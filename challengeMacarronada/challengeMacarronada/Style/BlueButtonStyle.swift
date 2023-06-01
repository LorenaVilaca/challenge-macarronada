//
//  ButtonStyle.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white)
            .frame(height: 35)
            .background(configuration.isPressed ? Color.white : Color.blue)
            .cornerRadius(4.0)
            .padding()
    }
}


