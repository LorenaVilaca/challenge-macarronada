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
    @StateObject private var graphDayViewModel = GraphViewModel()
    
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
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

