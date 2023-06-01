//
//  ClearButtonStyle.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 01/06/23.
//

import SwiftUI

struct ClearButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.clear : Color.clear)
            .frame(height: 35)
            .background(configuration.isPressed ? Color.clear : Color.clear)
            .cornerRadius(4.0)
            .padding()
    }
}
