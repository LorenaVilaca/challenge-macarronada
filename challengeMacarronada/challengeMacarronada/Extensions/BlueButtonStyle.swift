//
//  ButtonStyle.swift
//  testsCharts
//
//  Created by Cynara Costa on 25/05/23.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white)
            .font(.headline)
            .frame(height: 35)
            .background(configuration.isPressed ? Color.white : Color.blue)
            .cornerRadius(4.0)
            .padding()
    }
}
