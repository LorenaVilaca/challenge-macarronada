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
    
    init() {
        Shift.configureWithAppName("BPTiming")
    }
    var body: some Scene {
        WindowGroup {
              CoordinatorView()
        }
        MenuBarExtra("App Teste", systemImage: "clock", isInserted: $showMenuBarExtra) {
            StatusMenuView()
        }.menuBarExtraStyle(.window)
    }
}
