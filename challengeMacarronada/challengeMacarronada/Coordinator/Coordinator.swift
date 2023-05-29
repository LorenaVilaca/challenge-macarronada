//
//  Coordinator.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import Foundation
import SwiftUI

enum Page: String, Identifiable {
    case home
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case onboardingOne
    case onboardingTwo
    case onboardingThree
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dissmissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .onboardingOne:
            NavigationStack {
                AboutBPTime()
            }
        case .onboardingTwo:
            NavigationStack {
                NotificationScreen()
            }
        case .onboardingThree:
            NavigationStack {
                CalendarScreen()
            }
        }
    }
    
}
