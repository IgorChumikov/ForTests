//
//  Chart_SectorMark.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

/*
 Swift Charts — круговые диаграммы с SectorMark (iOS 16+)

 • SectorMark позволяет строить pie-charts и donut-charts, задавая сектор через угол.
 • angularInset добавляет зазор между секторами для лучшей читаемости.
 • cornerRadius работает специально для диаграмм, скругляя внешний край.
 • foregroundStyle(by:) раскрашивает сектора по категориям автоматически.
 • Подходит для отображения долей, распределений и статистики по группам.
 */


import SwiftUI
import Charts

// MARK: - View
struct Chart_SectorMark: View {
    let ownership = Share.fetchData()

    var body: some View {
        VStack(spacing: 24) {

            // Первый вариант — кастомный pie chart с эффектами
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value),
                    angularInset: 4 // небольшой зазор между секторами
                )
                .cornerRadius(8) // специальный cornerRadius для Charts
                .blur(radius: owner.label == "Celina" ? 4 : 0)
            }
            .frame(width: 214, height: 214)
            .padding(.horizontal)

            // Второй вариант — цветной pie chart с легендой
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value)
                )
                .foregroundStyle(by: .value("Owner", owner.label))
            }
            .frame(width: 214, height: 214)
            .chartLegend(position: .bottom, alignment: .center)
        }
        .padding()
        .dynamicTypeSize(.accessibility2)
    }
}

// MARK: - Preview
#Preview {
    Chart_SectorMark()
}
