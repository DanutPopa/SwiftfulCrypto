//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 22.04.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("AppGreen")
    let red = Color("AppRed")
    let secondaryText = Color("SecondaryTextColor")
}
