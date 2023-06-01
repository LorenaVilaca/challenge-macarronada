//
//  challengeMacarronadaApp.swift
//  challengeMacarronada
//
//  Created by Cynara Costa on 23/05/23.
//

import SwiftUI

@main
struct challengeMacarronadaApp: App {
    
    @StateObject var lnManager = NotificationManager.shared
    
    var body: some Scene {
        WindowGroup {
            NotificationView()
                .environmentObject(lnManager)
        }
    }
}
