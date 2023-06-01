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
    
<<<<<<< HEAD
    @StateObject var lnManager = NotificationManager.shared
    
    var body: some Scene {
        WindowGroup {
            NotificationView()
                .environmentObject(lnManager)
=======
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    
    init() {
        Shift.configureWithAppName("BPTiming")
    }
    var body: some Scene {
        WindowGroup {
              CoordinatorView()
>>>>>>> develop
        }
        MenuBarExtra("App Teste", systemImage: "star", isInserted: $showMenuBarExtra) {
            StatusMenuView()
        }.menuBarExtraStyle(.window)
    }
}
