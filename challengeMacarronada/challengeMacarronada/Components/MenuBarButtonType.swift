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
        HStack (spacing: 12) {
            Image(systemName: style == .up ? "arrow.up.right" : "arrow.down.right")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.white)
            Text(style == .up ? "Você está em pico!" : "Você está em queda!")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.white)
        }
        .padding([.bottom, .top], 14)
        .padding(.leading, 16)
        .padding(.trailing, 23)
        .frame(maxWidth: 258, maxHeight: 54)
        .background(Color.theme.upOrDownGray)
        .cornerRadius(15)
    }
}

struct MenuBarButtonType_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarButtonType(style: .up)
    }
}
