//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/8/21.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = CryptoCourseColorTheme()
    static let launch = CryptoCourseLaunchTheme()
    
}

struct CryptoCourseColorTheme {
    
    let accent = Color("Crypto_AccentColor")
    let background = Color("Crypto_BackgroundColor")
    let green = Color("Crypto_GreenColor")
    let red = Color("Crypto_RedColor")
    let secondaryText = Color("Crypto_SecondaryTextColor")
    
}

struct CryptoCourseColorTheme2 {
    let accent = Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
    let background = Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
    let green = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
    let red = Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))
    let secondaryText = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
}

struct CryptoCourseLaunchTheme {
    
    let accent = Color("Crypto_LaunchAccentColor")
    let background = Color("Crypto_LaunchBackgroundColor")
    
}
