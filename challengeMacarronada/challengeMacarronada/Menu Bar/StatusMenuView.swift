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
    @EnvironmentObject private var graphDayViewModel: GraphViewModel
    @Environment(\.managedObjectContext) var moc
    
    @State private var focusCircleRating = 1
    @State private var energyCircleRating = 1
    @State private var motivationCircleRating = 1
    
    class geo {
        
        static let size = geo()
        
        var width = 248.0
        var height = 509.0
        
    }
    
    var body: some View {
            
            ZStack (alignment: .center) {
                
                Image.theme.menuBarBackground
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 16) {
                    
                    HStack {
                        Image.theme.logo
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geo.size.width * 0.27, height: geo.size.height * 0.06)
                            .padding()
                            .padding(.top, geo.size.height * 0.07)
                        Spacer()
                        Image.theme.house
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.04)
                            .padding()
                            .padding(.top, geo.size.height * 0.07)
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.08)
                    .padding()
                    .background(Color.theme.HeaderMenuBarGrey)
                    .ignoresSafeArea()
                    
                    HStack {
                        Text(Text.texts.signs).textMenuBar()
                            .frame(width: geo.size.width * 0.83, height: geo.size.height * 0.04, alignment: .leading)
                    }
                    .frame(width: geo.size.width * 0.83, height: geo.size.height * 0.04, alignment: .leading)
                    
                    VStack (alignment: .leading, spacing:  16) {

                        RatingCircleComponent(circleRating: energyCircleRating, whichValue: .energy)
                            .frame(width: geo.size.width * 0.74, height: geo.size.height * 0.14, alignment: .leading)

                        RatingCircleComponent(circleRating: focusCircleRating, whichValue: .focus)
                            .frame(width: geo.size.width * 0.74, height: geo.size.height * 0.14, alignment: .leading)

                        RatingCircleComponent(circleRating: motivationCircleRating, whichValue: .motivation)
                            .frame(width: geo.size.width * 0.74, height: geo.size.height * 0.14, alignment: .leading)
                        
                        HStack {
                            Button {
                                
                                    let info = InfoHour(context: moc)
                                    info.id = UUID()
                                    info.hour = graphDayViewModel.selectedHour.description
                                    info.valueFocus = graphDayViewModel.valueFocus
                                    info.valueEnergy = graphDayViewModel.valueEnergy
                                    info.valueMotivation = graphDayViewModel.valueMotivation
                                    
                                    //                                try? moc.save()
                                
                                    print(info)

                            } label: {
                                
                                Image.theme.addButton
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .edgesIgnoringSafeArea(.all)
                                    .padding(.bottom, 4)
                                
                            }.buttonStyle(PlainButtonStyle())
                                
                        }
                        .frame(width: geo.size.width * 0.74, height: geo.size.height * 0.06, alignment: .trailing)
                        

                    }
                    .frame(width: geo.size.width * 0.87, height: geo.size.height * 0.61)
//                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    
                    Divider()
                        .frame(width: geo.size.width * 0.81)
                    
                    MenuBarButtonType(style: .up)
                        .frame(width: geo.size.width * 0.88, height: geo.size.height * 0.11)
                        .padding(.bottom, geo.size.height * 0.09)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        
    }
}



