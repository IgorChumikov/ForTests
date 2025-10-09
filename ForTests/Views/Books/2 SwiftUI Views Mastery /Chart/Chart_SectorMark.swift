//
//  Chart_SectorMark.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

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
