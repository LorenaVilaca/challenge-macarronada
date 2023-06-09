//
//  AboutBPTime.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 26/05/23.
//

import SwiftUI

struct AboutBPTime: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack (spacing: 32) {
            VStack (spacing: 32) {
                Image.theme.aboutBPTimeImage
            }
            .padding(.top, 48)
            VStack (spacing: 12) {
                HStack {
                    Text(Text.texts.greeting).headerTwo()
                    Spacer()
                }
                .padding(.leading, 80)
                HStack {
                    Text(Text.texts.textOnboardingOne).textOnboarding()
                        .frame(height: 72)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .trailing], 80)
            }
            VStack (spacing: 20) {
                ZStack {
                    Button {
                        coordinator.present(sheet: .onboardingTwo)
                    } label: {
                        Text(Text.texts.nextButton).textButtons()
                            .frame(maxWidth: 148)
                    }.buttonStyle(PurpleButtonStyle())
                }
                    HStack (alignment: .center) {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color.theme.upOrDownGray)
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color.theme.upOrDownGray)
                            .frame(width: 8, height: 8)
                    }
                    .padding(.bottom, 53)
            }
        }
        .frame(maxWidth: 800, maxHeight: 560)
    }
}

struct AboutBPTime_Previews: PreviewProvider {
    static var previews: some View {
        AboutBPTime()
    }
}
