//
//  SelectAvaliationCircle.swift
//  testsCoreData
//
//  Created by Cynara Costa on 30/05/23.
//

import SwiftUI


struct SelectAvaliationCircle: View {
    
    @State var maximumSelectedCircles: Int = 5
    @State var whichValue: typeOfFilter
    
    @EnvironmentObject var graphDayViewModel: GraphViewModel
    @Binding var rating: Int
    
    var body: some View {
        
        starsView
            .overlay(
                overlayView.mask(starsView)
            )
        
    }
    
    private var overlayView: some View {
        GeometryReader { geomatry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(whichValue.color)
                    .frame(width: CGFloat(rating) / 5 * geomatry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            
            ForEach(1..<maximumSelectedCircles + 1, id: \.self) { circlePosition in
                Circle()
                    .fill(Color.gray)
                    .onTapGesture {
                        withAnimation {
                            rating = circlePosition
                            
                            switch whichValue {
                            case .focus:
                                graphDayViewModel.valueFocus = Double(rating)
                            case .energy:
                                graphDayViewModel.valueEnergy = Double(rating)
                            case .motivation:
                                graphDayViewModel.valueMotivation = Double(rating)
                            case .general:
                                graphDayViewModel.valueFocus = Double(rating)
                            }
                        }
                        
                        
                    }
            }
            
        }
    }
    
}
