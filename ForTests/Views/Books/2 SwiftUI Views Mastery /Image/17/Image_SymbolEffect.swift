//
//  Image_SymbolEffect.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 symbolEffect (iOS 17+)

 • Позволяет анимировать SF Symbols
 • Есть разные эффекты: variableColor, pulse, bounce
 • Некоторые эффекты работают только с определёнными иконками
 • Анимация может запускаться при изменении value
 */

import SwiftUI

struct Image_SymbolEffect: View {
    @State private var start = false

    var body: some View {
        List {

            Label {
                Text("Variable Color")
            } icon: {
                Image(systemName: "airplayaudio")
                    .foregroundStyle(.teal)
                    .symbolEffect(.variableColor)
            }

            Label {
                Text("Pulse on Exclamation")
            } icon: {
                Image(systemName: "airplayaudio.badge.exclamationmark")
                    .foregroundStyle(.red, .teal)
                    .symbolEffect(.pulse)
            }

            Label {
                Text("Pulse")
            } icon: {
                Image(systemName: "lightbulb.max.fill")
                    .foregroundStyle(.teal)
                    .symbolEffect(
                        .bounce,
                        options: .repeating.repeat(2),
                        value: start
                    )
            }

            Button("Start") {
                start.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .listStyle(.plain)
        .listRowSpacing(60)
        .font(.title)
    }
}

#Preview {
    Image_SymbolEffect()
}
