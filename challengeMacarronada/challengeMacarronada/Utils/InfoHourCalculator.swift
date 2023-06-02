//
//  Focus.swift
//  testsCoreData
//
//  Created by Cynara Costa on 30/05/23.
//

import SwiftUI

class InfoHourCalculator {
    
    func calculate(infosDays: FetchedResults<InfoHour>, hour: String, whichValue: typeOfFilter) -> Double {
        
        let infoHourFiltered = infosDays.filter{ infoHour in
            infoHour.hour == hour
        }
        
        let sum = infoHourFiltered.reduce(0.0){ sumState, infoHour in
            switch whichValue {
            case .focus:
                return sumState + infoHour.valueFocus
            case .energy:
                return sumState + infoHour.valueEnergy
            case .motivation:
                return sumState + infoHour.valueMotivation
            case .general:
                return sumState
            }
            
        }
        
        return sum / Double(infoHourFiltered.count)
        
    }
    
    func getLargestValues(array: [(String, Double)]) -> [String] {
            let largestValue = array.max(by: { $0.1 < $1.1 })?.1
            let largestTuples = array.filter { $0.1 == largestValue }
            
            let largestFirstValues = largestTuples.map { $0.0 }
            
            return largestFirstValues
        }
    
    func getSmalletsValues(array: [(String, Double)]) -> [String] {
            let smallestValue = array.min(by: { $0.1 < $1.1 })?.1
            let smallestTuples = array.filter { $0.1 == smallestValue }
            
            let smallestFirstValues = smallestTuples.map { $0.0 }
            
            return smallestFirstValues
        }
    
    func getPeakProductivity(infosDays: FetchedResults<InfoHour>) -> [String] {
        
        var arrayProductivity: [(String, Double)] = []
        
        
        for infoHour in infosDays {
            
            let mediaFocus = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .focus)
            let mediaEnergy = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .energy)
            let mediaMotivation = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .motivation)
            
            let mediaInThisHour = (mediaFocus + mediaEnergy + mediaMotivation) / 3
            
            arrayProductivity.append((infoHour.hour!, mediaInThisHour))
            
        }
        
//        print(getLargestValues(array: arrayProductivity))
        return getLargestValues(array: arrayProductivity)
        
    }
    
    func getLowProductivity(infosDays: FetchedResults<InfoHour>) -> [String] {
        var arrayProductivity: [(String, Double)] = []
        
        
        for infoHour in infosDays {
            
            let mediaFocus = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .focus)
            let mediaEnergy = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .energy)
            let mediaMotivation = calculate(infosDays: infosDays, hour: infoHour.hour!, whichValue: .motivation)
            
            let mediaInThisHour = (mediaFocus + mediaEnergy + mediaMotivation) / 3
            
            arrayProductivity.append((infoHour.hour!, mediaInThisHour))
            
        }
        
//        print(getSmalletsValues(array: arrayProductivity))
        return getSmalletsValues(array: arrayProductivity)
    }
    
    func isThisHourPeakOrLow(infosDays: FetchedResults<InfoHour>, hour: String) -> ButtonTypeStyle {
        
        let peakHours = getPeakProductivity(infosDays: infosDays)
        let lowHours = getLowProductivity(infosDays: infosDays)
        
        if peakHours.contains("\(hour)h") {
            return .up
        } else if lowHours.contains("\(hour)h") {
            return .down
        } else {
            return .empty
        }
    }
    
}

