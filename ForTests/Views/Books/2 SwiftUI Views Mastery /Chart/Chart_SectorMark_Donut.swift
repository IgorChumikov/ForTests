//
//  Chart_SectorMark_Donut.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import SwiftUI
import Charts

// MARK: - View
struct Chart_SectorMark_Donut: View {
    let ownership = Share.fetchData()

    var body: some View {
        VStack(spacing: 32) {

            // Вариант 1 — фиксированный внутренний радиус (узкое кольцо)
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value),
                    innerRadius: .fixed(40) // фиксированное отверстие
                )
                .foregroundStyle(by: .value("Owner", owner.label))
            }
            .frame(width: 214, height: 214)

            // Вариант 2 — относительные радиусы (гибкое масштабирование)
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value),
                    innerRadius: .ratio(0.5),   // 50% внутреннего радиуса
                    outerRadius: .inset(50)     // отступ от внешнего края
                )
                .foregroundStyle(by: .value("Owner", owner.label))
            }
            .frame(width: 214, height: 214)
        }
        .chartLegend(position: .bottom, alignment: .center)
        .dynamicTypeSize(.accessibility2)
        .padding()
    }
}

// MARK: - Preview
#Preview {
    Chart_SectorMark_Donut()
}
