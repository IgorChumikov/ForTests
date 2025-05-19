//
//  Color+Extension.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2025.
//

import SwiftUI

extension Color {
    init?(cp_fromHex hexString: String) { // #RGB or #ARGB: #5500de or #ff5500de
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).uppercased()
        
        var value: UInt64 = 0
        if !Scanner(string: hex).scanHexInt64(&value) { return nil }
        
        let a, r, g, b: UInt64
        switch hex.count {
            case 6: // RGB
                (a, r, g, b) = (255, value >> 16, value >> 8 & 0xFF, value & 0xFF)
            case 8: // ARGB
                (a, r, g, b) = (value >> 24, value >> 16 & 0xFF, value >> 8 & 0xFF, value & 0xFF)
            default:
                return nil
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, opacity: CGFloat(a) / 255)
    }
    
    static func getColor(from hexString: String?, defaultColor: Color) -> Color {
        guard let hexString else { return defaultColor }
        return Color(cp_fromHex: hexString) ?? defaultColor
    }
}

extension Color {
    /// Инициализатор для создания цвета из шестнадцатеричной строки
    /// - Parameter hex: Строка в формате HEX (например, "#FF5733" или "FF5733")
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xFF0000) >> 16) / 255
            let g = Double((hexNumber & 0x00FF00) >> 8) / 255
            let b = Double(hexNumber & 0x0000FF) / 255
            self.init(red: r, green: g, blue: b)
        } else {
            self = .clear
        }
    }
}
