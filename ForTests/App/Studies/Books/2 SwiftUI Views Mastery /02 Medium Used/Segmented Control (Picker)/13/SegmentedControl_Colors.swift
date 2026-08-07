//
//  SegmentedControl_Colors.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Segmented Control (Picker) — настройка цвета (iOS 13+)

 • Цвет фона изменяется через .background()
 • Для аккуратного оформления можно использовать RoundedRectangle
 • Можно применять accentColor с прозрачностью
*/

import SwiftUI

struct SegmentedControl_Colors: View {
    @State private var selection = 2

    var body: some View {
        VStack(spacing: 60) {
            // Вариант 1 — сплошной цвет
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(.segmented)
            .background(Color.pink)

            // Вариант 2 — цвет в скруглённой форме
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(.segmented)
            .background(Color.pink, in: RoundedRectangle(cornerRadius: 8))

            // Вариант 3 — использование accentColor с прозрачностью
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(.segmented)
            .background(Color.accentColor.opacity(0.6), in: RoundedRectangle(cornerRadius: 8))
        }
        .padding(.horizontal)
    }
}

#Preview {
    SegmentedControl_Colors()
}
