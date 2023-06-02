//
//  challengeMacarronadaApp.swift
//  challengeMacarronada
//
//  Created by Cynara Costa on 23/05/23.
//

import SwiftUI
import Shift

@main
struct challengeMacarronadaApp: App {
    
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    @StateObject var graphDayViewModel = GraphViewModel()
    
    init() {
        Shift.configureWithAppName("BPTiming")
    }
    var body: some Scene {
        WindowGroup {
              CoordinatorView()
                .environmentObject(graphDayViewModel)
        }
        MenuBarExtra("App Teste", systemImage: "star", isInserted: $showMenuBarExtra) {
            StatusMenuView()
                .environmentObject(graphDayViewModel)
        }
        .menuBarExtraStyle(.window)
    }
}
