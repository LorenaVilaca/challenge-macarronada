//
//  PurpleButtonStyle.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI

struct PurpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.purple : Color.white)
            .frame(height: 35)
            .background(configuration.isPressed ? Color.white : Color.purple)
            .cornerRadius(4.0)
            .padding()
    }
}
