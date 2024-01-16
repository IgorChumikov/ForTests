//
//  ContentView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

struct ContentView2: View {
    @State private var scaleUp = false
    @State private var fadeOut = false

    var body: some View {
        Button("Tap Me!") {
            withAnimation {
                scaleUp = true
            } completion: {
                withAnimation {
                    fadeOut = true
                }
            }
        }
        .scaleEffect(scaleUp ? 1 : 3)
        .opacity(fadeOut ? 0 : 1)
    }
}

#Preview {
    ContentView2()
}
