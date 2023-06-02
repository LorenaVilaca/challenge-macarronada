//
//  NotificationScreen.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 26/05/23.
//

import SwiftUI

struct NotificationScreen: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var notificationManager: NotificationManager
    
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
                            notificationManager.requestAuthorization()
                        } label: {
                            Text(Text.texts.enable).textButtons()
                                .frame(maxWidth: 148)
                        }.buttonStyle(PurpleButtonStyle())
                    }
                }
                .padding([.leading, .trailing], 80)
            }
            HStack (alignment: .center) {
                Circle()
                    .fill(Color.theme.upOrDownGray)
                    .frame(width: 8, height: 8)
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                Circle()
                    .fill(Color.theme.upOrDownGray)
                    .frame(width: 8, height: 8)
            }
            .padding(.bottom, 53)
        }
        .frame(maxWidth: 800, maxHeight: 560)
        .onDisappear(){
            let localNotification = LocalNotification(identifier: UUID().uuidString,
                                                                          title: "Como você está agora?",
                                                                          body: "Nos informe como está seu Foco, sua Energia e sua Motivação.",
                                                                          repeats: true)
            notificationManager.deleteNotifications()
            notificationManager.scheduleTriggerNotification(localNotification: localNotification)
            notificationManager.printNotifications()

        }
    }
}

struct NotificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationScreen()
    }
}
