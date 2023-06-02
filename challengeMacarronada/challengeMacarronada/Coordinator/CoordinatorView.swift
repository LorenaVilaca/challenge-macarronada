//
//  CoordinatorView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var coordinator = Coordinator()
    
    @StateObject private var dataController = DataController()
    @EnvironmentObject private var graphDayViewModel: GraphViewModel
    @StateObject private var notificationManager = NotificationManager.shared
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
            
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .environmentObject(coordinator)
        .environmentObject(graphDayViewModel)
        .environmentObject(notificationManager)
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

