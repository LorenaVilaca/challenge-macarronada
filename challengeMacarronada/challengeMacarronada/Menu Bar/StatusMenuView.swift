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
    
    var body: some View {
        VStack (spacing: 16) {
            VStack (spacing: 16) {
                HStack {
                    Image.theme.logo
                    Spacer()
                    ZStack {
                        Button {
//                            coordinator.present(page: .home)
                        } label: {
                            Image(systemName: "house")
                                .foregroundColor(Color.theme.imagesMenuBar)
                                .font(.system(size: 22, weight: .medium))
                        }.buttonStyle(ClearButtonStyle())
                    }
                }
                .padding(.leading, 22)
                .padding(.trailing, 16)
                .background(Color.theme.HeaderMenuBarGrey)
                .ignoresSafeArea()
                HStack {
                    Text(Text.texts.signs).headerOnboarding()
                        .multilineTextAlignment(.leading)
                    .padding(.leading, 16)
                    Spacer()
                }
            }
            VStack {
                VStack (spacing: 18) {
                    HStack (spacing: 12) {
                        Image("camera-pink")
                        Text(Text.texts.focus)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.top, .leading,], 16)
                    HStack (spacing: 8.57) {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding([.bottom, .leading,], 16)
                }
                VStack (spacing: 18) {
                    HStack (spacing: 16) {
                        Image("lightning")
                        Text(Text.texts.energy)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.top, .leading,], 16)
                    HStack (spacing: 8.57) {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding([.bottom, .leading,], 16)
                }
                VStack (spacing: 18) {
                    HStack (spacing: 14) {
                        Image("meditation-blue")
                        Text(Text.texts.motivation)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.top, .leading,], 16)
                    HStack (spacing: 8.57) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Circle()
                            .fill(Color.theme.imagesMenuBar)
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding(.leading, 16)
                }
                HStack {
                    Spacer()
                    Button {
                        //                    coordinator.present(sheet: .onboardingTwo)
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(width: 55, height: 30)
                    }.buttonStyle(WhiteButtonStyle())
                }
            }
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
            .padding([.leading, .trailing], 16)
            Divider()
                .padding([.trailing, .leading], 23.5)
            MenuBarButtonType(style: .up)
                .padding(.bottom, 16)
            //Spacer()
        }
        .background(Image("MenuBarBackground").resizable())
        .ignoresSafeArea()
    }
}

struct StatusMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StatusMenuView()
    }
}
