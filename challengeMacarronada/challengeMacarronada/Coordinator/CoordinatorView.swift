//
//  CoordinatorView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var coordinator = Coordinator()
    
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
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
