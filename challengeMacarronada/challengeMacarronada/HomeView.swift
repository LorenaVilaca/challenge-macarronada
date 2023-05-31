//
//  HomeView.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            MenuBarButtonType(style: .down)
        }
        .onAppear {
            coordinator.present(sheet: .onboardingOne)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
