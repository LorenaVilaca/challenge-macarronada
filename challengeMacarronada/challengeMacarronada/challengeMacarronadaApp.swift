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
    @StateObject private var dataController = DataController()
    
    init() {
        Shift.configureWithAppName("BPTiming")
    }
    var body: some Scene {
        WindowGroup {
              CoordinatorView()
                .environmentObject(graphDayViewModel)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        MenuBarExtra("App Teste", systemImage: "clock", isInserted: $showMenuBarExtra) {
            StatusMenuView()
                .environmentObject(graphDayViewModel)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        .menuBarExtraStyle(.window)
    }
}
