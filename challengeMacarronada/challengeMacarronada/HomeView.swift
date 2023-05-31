//
//  HomeView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI
import Charts

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.hour)]) var infosDays: FetchedResults<InfoHour>
    
    @EnvironmentObject var graphDayViewModel: GraphViewModel
    
    let dataFormat = DataFormat()
    let Calculator = InfoHourCalculator()
    
    @State private var focusCircleRating = 1
    @State private var energyCircleRating = 1
    @State private var motivationCircleRating = 1
    
    var body: some View {
        VStack {
            
            Text(Text.texts.titleBPT).headerOne()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            
            HStack {
                
                VStack (alignment: .leading) {
                    
                    Text(Text.texts.fillInSignals).headerTwo()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    
                    Picker(Text.texts.empty, selection: $graphDayViewModel.selectedSegmented) {
                        ForEach(segmented.allCases) { option in
                            Text(String(describing: option))
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    VStack {
                        
                        if graphDayViewModel.selectedSegmented == .now {
                            
                            Text("\(Text.texts.timeNow) \(graphDayViewModel.currentTime)").headerThree()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .padding()
                                .onReceive(graphDayViewModel.timer) { _ in
                                    graphDayViewModel.currentTime = dataFormat.formatCurrentTime()
                                }
                            
                        } else {
                            
                            Picker(Text.texts.empty, selection: $graphDayViewModel.selectedHour) {
                                ForEach(hours.allCases) { option in
                                    Text(String(describing: option))
                                        .foregroundColor(.white)
                                }
                            }.padding()
                        }
                        
                        VStack (alignment: .leading) {
                            
                            RatingCircleComponent(circleRating: focusCircleRating, whichValue: .focus)
                            RatingCircleComponent(circleRating: energyCircleRating, whichValue: .energy)
                            RatingCircleComponent(circleRating: motivationCircleRating, whichValue: .motivation)
                            
                        }
                        
                        
                        
                        Button {
                            
                            if graphDayViewModel.selectedSegmented == .now {
                                
                                let info = InfoHour(context: moc)
                                let currentDate = Date()
                                let hourString = dataFormat.getHourString(from: currentDate)
                                
                                info.id = UUID()
                                info.day = graphDayViewModel.selectedCreateDate
                                info.hour = "\(hourString)h"
                                info.valueFocus = graphDayViewModel.valueFocus
                                info.valueEnergy = graphDayViewModel.valueEnergy
                                info.valueMotivation = graphDayViewModel.valueMotivation
                                
//                                try? moc.save()
                                
                                print(info)
                                
                            } else {
                                
                                let info = InfoHour(context: moc)
                                info.id = UUID()
                                info.hour = graphDayViewModel.selectedHour.description
                                info.valueFocus = graphDayViewModel.valueFocus
                                info.valueEnergy = graphDayViewModel.valueEnergy
                                info.valueMotivation = graphDayViewModel.valueMotivation
                                
//                                try? moc.save()
                                
                                print(info)
                                
                            }
                            
                           
                            
                        } label: {
                            Text(Text.texts.add)
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.buttonStyle(BlueButtonStyle())
                        
                        
                        Button {
                            Calculator.getPeakProductivity(infosDays: infosDays)
                            Calculator.getLowProductivity(infosDays: infosDays)
//                            print(graphDayViewModel.selectedHour)
                        } label: {
                            Text("Teste")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }.buttonStyle(BlueButtonStyle())
                        
                        
                    }
                    
                    
                    Spacer()
                    
                }
                .background(Color.indigo)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
                
                VStack {
                    
                    Text(Text.texts.yourChart).headerTwo()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Picker(Text.texts.empty, selection: $graphDayViewModel.selectedTypeOfFilter) {
                        ForEach(typeOfFilter.allCases) { option in
                            Text(String(describing: option))
                        }
                    }.pickerStyle(.segmented)
                    
                    Chart {

                        if graphDayViewModel.selectedTypeOfFilter == .general || graphDayViewModel.selectedTypeOfFilter == .focus {
                            ForEach(infosDays) { day in
                                LineMark(
                                    x: .value(Text.texts.hour, day.hour!),
                                    y: .value(Text.texts.value, Calculator.calculate(infosDays: infosDays, hour: day.hour!, whichValue: .focus))
                                )
                                .foregroundStyle(by: .value(Text.texts.date, Text.texts.focus))
                                .lineStyle(StrokeStyle(lineWidth: 3))
                                .symbol() {
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 12, height: 12)
                                }

                                
                            }
                            
                        }
                        
                        if graphDayViewModel.selectedTypeOfFilter == .general || graphDayViewModel.selectedTypeOfFilter == .energy {
                            ForEach(infosDays) { day in
                                LineMark(
                                    x: .value(Text.texts.hour, day.hour!),
                                    y: .value(Text.texts.value, Calculator.calculate(infosDays: infosDays, hour: day.hour!, whichValue: .energy))
                                )
                                .foregroundStyle(by: .value(Text.texts.date, Text.texts.energy))
                                .lineStyle(StrokeStyle(lineWidth: 3))
                                .symbol() {
                                    Rectangle()
                                        .fill(.blue)
                                        .frame(width: 12, height: 12)
                                }
                                
                            }
                            
                        }
                        
                        if graphDayViewModel.selectedTypeOfFilter == .general || graphDayViewModel.selectedTypeOfFilter == .motivation {
                            ForEach(infosDays) { day in
                                LineMark(
                                    x: .value(Text.texts.hour, day.hour!),
                                    y: .value(Text.texts.value, Calculator.calculate(infosDays: infosDays, hour: day.hour!, whichValue: .motivation))
                                )
                                .foregroundStyle(by: .value(Text.texts.date, Text.texts.motivation))
                                .lineStyle(StrokeStyle(lineWidth: 3))
                                .symbol() {
                                    Triangle()
                                        .fill(.green)
                                        .frame(width: 12, height: 12)
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    .padding()
                    .chartForegroundStyleScale(
                        domain: [Text.texts.focus, Text.texts.energy, Text.texts.motivation],
                        range: [.red, .blue, .green]
                    )
                    
                    
                    
                }
                
            }
            
            
        }
        .onAppear {
            coordinator.present(sheet: .onboardingOne)
        }
    }
}

