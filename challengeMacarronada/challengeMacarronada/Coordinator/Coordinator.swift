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

class OnboardingManager {
    
    static let shared = OnboardingManager()
    
    var sheetQuantity = 3
    
    var didUserNotSeenOnboarding: Bool {
        return UserDefaults.standard.value(forKey: "onboardinggg") != nil
    }
    
    private init () {}
    
    func onboardingWasSeen() {
        UserDefaults.standard.setValue(true, forKey: "onboardinggg")
        
    }
    
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    var sheetQuantity = 3
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        if OnboardingManager.shared.didUserNotSeenOnboarding { return }
        self.sheet = sheet
        sheetQuantity -= 1
        
        if sheetQuantity == 0 {
            OnboardingManager.shared.onboardingWasSeen()
        }

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
