//
//  HomeView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI
import Charts
//import AxisSegmentedView

struct HomeView: View {
    
    init () {
//        NSSegmentedControl.Style = .rounded
    }
    
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.hour)]) var infosDays: FetchedResults<InfoHour>
    
    @State private var selection: Int = 0
    
    @EnvironmentObject var graphDayViewModel: GraphViewModel
    
    let dataFormat = DataFormat()
    let Calculator = InfoHourCalculator()
    
    @State private var focusCircleRating = 1
    @State private var energyCircleRating = 1
    @State private var motivationCircleRating = 1
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                Image.theme.background
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center) {
                    
                    GeometryReader { geometry in
                        
                        HStack {
                            
                            VStack (alignment: .leading) {
                                
                                
                                VStack {
                                    
                                    Picker(Text.texts.empty, selection: $graphDayViewModel.selectedSegmented) {
                                        ForEach(segmented.allCases) { option in
                                            Text(String(describing: option))
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    
                                }
                                .frame(height: 30)
                                .foregroundColor(.white)
                                .background(.clear)
                                .border(.white, width: 1)
                                .cornerRadius(8)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .font(.headline)
                                
                                
                                
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
                            .frame(width: geometry.size.width * 0.26, height: geometry.size.height)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            
                            Spacer()
                            
                            VStack {
                                
                                VStack {
                                    Text(Text.texts.knowMore).secondTitle()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    ZStack {
                                        VStack (alignment: .leading) {
                                            
                                            Text(Text.texts.whatBPT).FEM_menuBar()
                                                .padding()
                                            
                                            Text(Text.texts.nemo).textRegular()
                                                .lineSpacing(10)
                                                .padding()
                                            
                                        }
                                        .padding()
                                        .frame(width: geometry.size.width * 0.23, height: geometry.size.height * 0.46, alignment: .leading)
                                    }
                                    .frame(width: geometry.size.width * 0.59, height: geometry.size.height * 0.59, alignment: .leading)
                                    .background(
                                        Image.theme.backgroundKnowMore
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .edgesIgnoringSafeArea(.all)
                                    )
                                    
                                }
                                
                                
                            }
                            .frame(width: geometry.size.width * 0.7, height: geometry.size.height)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    
                    VStack {
                        
                        Text(Text.texts.yourChart).headerTwo()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        
                        VStack {
                            
                            Picker(Text.texts.empty, selection: $graphDayViewModel.selectedTypeOfFilter) {
                                ForEach(typeOfFilter.allCases) { option in
                                    Text(String(describing: option))
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            
                            
                        }
                        .frame(height: 30)
                        .foregroundColor(.white)
                        .background(.clear)
                        .border(.white, width: 1)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .font(.headline)
                        
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

                .onAppear {
                    coordinator.present(sheet: .onboardingOne)
                }
                .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.89)
                
            }
            
            
        }
    }
}




//AxisSegmentedView(selection: $selection, constant: .init()) {
//    Image(systemName: "align.horizontal.left")
//        .itemTag(0, selectArea: 500) {
//            Image(systemName: "align.horizontal.left.fill")
//        }
//    Image(systemName: "align.horizontal.right")
//        .itemTag(1, selectArea: 500) {
//            Image(systemName: "align.horizontal.right.fill")
//        }
//    Image(systemName: "align.vertical.top")
//        .itemTag(2, selectArea: 500) {
//            Image(systemName: "align.vertical.top.fill")
//        }
//    Image(systemName: "align.vertical.bottom")
//        .itemTag(3, selectArea: 500) {
//            Image(systemName: "align.vertical.bottom.fill")
//        }
//} style: {
//    ASBasicStyle()
//} onTapReceive: { selectionTap in
//    /// Imperative syntax
//    print("---------------------")
//    print("Selection : ", selectionTap)
//    print("Already selected : ", self.selection == selectionTap)
//}
//.frame(height: 44)
