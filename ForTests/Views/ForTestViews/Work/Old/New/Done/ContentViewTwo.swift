//
//  ContentViewTwo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

struct ContentViewTwo: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Показать алерт в View Two") {
                showAlert = true
            }
        }
        .overlay(ExitAlertView(isPresented: $showAlert))
    }
}

#Preview {
    ContentViewTwo()
}
