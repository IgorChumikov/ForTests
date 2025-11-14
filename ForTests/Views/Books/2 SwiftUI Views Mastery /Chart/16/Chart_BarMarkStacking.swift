//
//  Chart_BarMarkStacking.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

/*
 Swift Charts — вертикальная группировка и стековое отображение BarMark (iOS 16+)

 • BarMark поддерживает stacking, позволяя складывать значения в один столбец.
 • Режимы stacking:
    – .standard — обычное сложение значений (стек наверх).
    – .normalized — превращает столбец в проценты (от 0 до 100%).
    – .center — симметричное центрированное отображение (как для распределений).
 • foregroundStyle(by:) раскрашивает сегменты графика по группе.
 • Удобно для визуального сравнения категорий внутри каждого столбца.
 */


import SwiftUI
import Charts

// MARK: - View
struct Chart_BarMarkStacking: View {
    @State private var data = GroupInfo.fetchData()

    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Category", $0.x),
                y: .value("Quantity", $0.y),
                stacking: .standard // можно также .normalized или .center
            )
            .foregroundStyle(by: .value("Group", $0.group))
        }
        .padding()
        .frame(height: 250)
        .dynamicTypeSize(.xLarge)
    }
}

// MARK: - Preview
#Preview {
    Chart_BarMarkStacking()
}
