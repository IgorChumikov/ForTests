//
//  View+HideKeyboard.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.05.2024.
//

import SwiftUI

//code to close the keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
