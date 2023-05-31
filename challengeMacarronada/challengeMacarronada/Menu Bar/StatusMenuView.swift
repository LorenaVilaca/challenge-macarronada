//
//  StatusMenu.swift
//  MenuBarStudy
//
//  Created by LoreVilaca on 23/05/23.
//

import Foundation
import SwiftUI

struct StatusMenuView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var slider = 2.0
    @State private var isEditing = false
    @Environment (\.openWindow) private var openWindow
    var body: some View {
        VStack (spacing: 24) {
            VStack (spacing: 32) {
                HStack (spacing: 123) {
                    Rectangle()
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color.theme.imagesMenuBar)
                    Image(systemName: "house")
                        .foregroundColor(Color.theme.imagesMenuBar)
                        .font(.system(size: 25, weight: .bold))
                }
                .padding([.leading, .trailing, .top], 24)
                HStack {
                    Text(Text.texts.signs).headerOnboarding()
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 24)
            }
            VStack (spacing: 18) {
                HStack (spacing: 14) {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 18, weight: .bold))
                    Text(Text.texts.energy).textButtons()
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding(.leading, 24)
                HStack (spacing: 8.98) {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Spacer()
                }
                .padding(.leading, 24)
            }
            VStack (spacing: 18) {
                HStack (spacing: 16) {
                    Image("camera")
                    Text(Text.texts.focus)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding(.leading, 24)
                HStack (spacing: 8.98) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Spacer()
                }
                .padding(.leading, 24)
            }
            VStack (spacing: 18) {
                HStack (spacing: 14) {
                    Image("meditation")
                    Text(Text.texts.motivation)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding(.leading, 24)
                HStack (spacing: 8.98) {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Circle()
                        .fill(Color.theme.imagesMenuBar)
                        .frame(width: 31.42, height: 31.42)
                    Spacer()
                }
                .padding(.leading, 24)
            }
            ZStack {
                Button {
//                    coordinator.present(sheet: .onboardingTwo)
                } label: {
                    Text(Text.texts.send)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(maxWidth: 148/*, maxWidth: .infinity*/)
                }.buttonStyle(PurpleButtonStyle())
            }
            Divider()
                .frame(width: 258)
            MenuBarButtonType(style: .up)
//            Text ("Você está em queda de energia")
//            Button ("Veja o resumo completo"){
//                print ("foi")
//                openWindow(id: "app")
//            }
//            Divider()
//                .padding(.horizontal, 10.0)
//            Slider(
//                        value: $slider,
//                        in: 1...5,
//                        onEditingChanged: { editing in
//                            isEditing = editing
//                        }
//            )
//            Text ("alo")
//            Slider(value: Binding(
//                            get: { slider },
//                            set: { newValue in
//                                slider = round(newValue)
//
//                            }
//                        ), in: 1...5)
            
        }
        .padding(.vertical)
        .background(Color.theme.menuBarBack)
    }
}

struct StatusMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StatusMenuView()
    }
}


struct CustomSlider: View {
    var body: some View {
        Text("")
    }
}
