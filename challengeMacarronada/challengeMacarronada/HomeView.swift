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
            Color.green
                .edgesIgnoringSafeArea(.all)
            Button {

            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(20))
            }
//            .frame(maxWidth: 800, maxHeight: 560)

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
