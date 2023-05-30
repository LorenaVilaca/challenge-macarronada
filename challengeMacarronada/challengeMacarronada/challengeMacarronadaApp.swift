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
    init() {
        Shift.configureWithAppName("BPTiming")
    }
    var body: some Scene {
        WindowGroup {
//            AboutBPTime()
//            HomeView()
              CoordinatorView()
        }
    }
}
