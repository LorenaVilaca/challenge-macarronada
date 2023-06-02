import SwiftUI

extension Color {
    static let theme = ColorThemes()
    static let gradients = Gradients()
}

struct ColorThemes {
    let circleGray = Color("circle_color")
    let upOrDownGray = Color("up_or_down")
    let menuBarBack = Color("menu_bar_background")
    let imagesMenuBar = Color("images_menu_bar")
    let FirstBlueGradient = Color("FirstBlueGradient")
    let SecondBlueGradient = Color("SecondBlueGradient")
    let FirstPinkGradient = Color("FirstPinkGradient")
    let SecondPinkGradient = Color("SecondPinkGradient")
    let FirstYellowGradient = Color("FirstYellowGradient")
    let SecondYellowGradient = Color("SecondYellowGradient")
    let HeaderMenuBarGrey = Color("header_menuBar")
    let DarkGreyBackground = Color("DarkGreyBackground")
}

struct Gradients {
    
    let grayScale = LinearGradient(
        gradient: Gradient(colors: [Color.gray, Color.gray]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    let blueScale = LinearGradient(
        gradient: Gradient(
        colors: [Color.theme.FirstBlueGradient, Color.theme.SecondBlueGradient]),
        startPoint: .top,
        endPoint: .bottom)
    
    let pinkScale = LinearGradient(
        gradient: Gradient(
        colors: [Color.theme.FirstPinkGradient, Color.theme.SecondPinkGradient]),
        startPoint: .top,
        endPoint: .bottom)
    
    let yellowScale = LinearGradient(
        gradient: Gradient(
        colors: [Color.theme.FirstYellowGradient, Color.theme.SecondYellowGradient]),
        startPoint: .top,
        endPoint: .bottom)
    
    let clear = LinearGradient(
        gradient: Gradient(
            colors: [Color.clear, Color.clear]),
        startPoint: .top,
        endPoint: .bottom)
    
}


