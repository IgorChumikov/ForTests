//
//  ContentViewOne2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

struct ContentViewOne2: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Показать алерт в View One") {
                showAlert = true
            }
        }
        .exitAlert1(isPresented: $showAlert)
    }
}

#Preview {
    ContentViewOne2()
}
