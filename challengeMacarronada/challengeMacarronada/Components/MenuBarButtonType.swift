//
//  MenuBarButtonType.swift
//  challengeMacarronada
//
//  Created by Guilherme Souza on 30/05/23.
//

import SwiftUI

struct MenuBarButtonType: View {
    
    let style: ButtonTypeStyle
    
    var body: some View {
        
        if style == .empty {
            VStack {
                EmptyView()
            }
            .padding(7)
            .frame(maxWidth: 258, minHeight: 55)
            .background(Color.white.opacity(0.0))
            .cornerRadius(15)
                
        } else {
            HStack {
                Image(systemName: style == .up ? "arrow.up.right" : "arrow.down.right")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.white)

                Text(style == .up ? Text.texts.peak : Text.texts.low)
                    .textMenuBar()
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color.white)
            }
            .padding(7)
            .frame(maxWidth: 258, minHeight: 55)
            .background(Color.white.opacity(0.1))
            .cornerRadius(15)
        }
        
    }
}

struct MenuBarButtonType_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarButtonType(style: .up)
    }
}
