//
//  GraphDayViewModel.swift
//  testsCoreData
//
//  Created by Cynara Costa on 27/05/23.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    
    @Published var hour: String = ""
    
    @Published var valueFocus: Double = 1
    @Published var valueEnergy: Double = 1
    @Published var valueMotivation: Double = 1
    
    @Published var selectedCreateDate = Date()
    @Published var selectedGraphDate = Date()
    
    @Published var selectedTypeOfFilter: typeOfFilter = .general
    @Published var selectedSegmented: segmented = .now
    @Published var selectedHour: hours = .eight
    
    @Published var currentTime = ""
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func addGaussianNoise(to value: Double, mean: Double, standardDeviation: Double) -> Double {
        // Gera um número aleatório entre 0 e 1
        let randomValue = Double.random(in: 0...1)
        let noise = standardDeviation * sqrt(-2 * log(randomValue)) * cos(2 * .pi * randomValue) // Ruído gaussiano
        return value + (mean + noise)
    }
    
}

