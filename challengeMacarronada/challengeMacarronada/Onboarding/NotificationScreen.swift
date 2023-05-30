//
//  NotificationScreen.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 26/05/23.
//

import SwiftUI

struct NotificationScreen: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack (spacing: 32) {
            VStack (spacing: 32) {
                Image.theme.notificationScreenImage
            }
            .padding(.top, 48)
            VStack (spacing: 12) {
                HStack {
                    Text(Text.texts.notification).headerOnboarding()
                    Spacer()
                }
                .padding(.leading, 80)
                HStack (alignment: .top) {
                    Text(Text.texts.textOnboardingTwo).textOnboarding()
                        .frame(height: 72)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .trailing], 80)
            }
            VStack {
                HStack (spacing: 16) {
                    ZStack {
                        Button {
                            coordinator.present(sheet: .onboardingThree)
                        } label: {
                            Text(Text.texts.allow).textButtons()
                                .frame(maxWidth: 148/*, maxWidth: .infinity*/)
                        }.buttonStyle(PurpleButtonStyle())
                    }
                    ZStack {
                        Button {
                            coordinator.present(sheet: .onboardingThree)
                        } label: {
                            Text(Text.texts.notNow)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: 148/*, maxWidth: .infinity*/)
                        }.buttonStyle(WhiteButtonStyle())
                    }
                }
                .padding([.leading, .trailing], 80)
            }
            HStack (alignment: .center) {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 8, height: 8)
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                Circle()
                    .fill(Color.gray)
                    .frame(width: 8, height: 8)
            }
            .padding(.bottom, 53)
        }
        .frame(maxWidth: 800, maxHeight: 560)
    }
}

struct NotificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationScreen()
    }
}
