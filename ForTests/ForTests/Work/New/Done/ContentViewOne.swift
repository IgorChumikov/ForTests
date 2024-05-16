//
//  ContentViewOne.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

struct ContentViewOne: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Показать алерт в View One") {
                showAlert = true
            }
        }
        .background(CustomAlertView(isPresented: $showAlert))
    }
}

#Preview {
    ContentViewOne()
}
