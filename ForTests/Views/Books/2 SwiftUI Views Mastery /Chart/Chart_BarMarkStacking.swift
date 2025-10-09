//
//  Chart_BarMarkStacking.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

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
