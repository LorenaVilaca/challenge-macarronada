//
//  enumTypeOfFilter.swift
//  testsCoreData
//
//  Created by Cynara Costa on 27/05/23.
//

import SwiftUI

enum typeOfFilter: CaseIterable, Identifiable, CustomStringConvertible {
    
    case general
    case focus
    case energy
    case motivation
    
    var id: Self { self }
    
    var description: String {
        
        switch self {
        case .general:
            return "Geral"
        case .focus:
            return "Foco"
        case .energy:
            return "Energia"
        case .motivation:
            return "Motivação"
        }
    }
    
    var color: LinearGradient {
        switch self {
        case .focus:
            return Color.gradients.pinkScale
        case .energy:
            return Color.gradients.yellowScale
        case .motivation:
            return Color.gradients.blueScale
        case .general:
            return Color.gradients.grayScale
        }
    }
    
    var text: String {
        switch self {
        case .focus:
            return Text.texts.focus
        case .energy:
            return Text.texts.energy
        case .motivation:
            return Text.texts.motivation
        case .general:
            return Text.texts.empty
        }
    }
    
}
