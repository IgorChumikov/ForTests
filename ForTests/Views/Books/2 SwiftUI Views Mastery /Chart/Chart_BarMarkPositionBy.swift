//
//  Chart_BarMarkPositionBy.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import SwiftUI
import Charts


// MARK: - View
struct Chart_BarMarkPositionBy: View {
    @State private var data = GroupInfo.fetchData()

    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Category", $0.x),
                y: .value("Quantity", $0.y),
                width: 32
            )
            .foregroundStyle(by: .value("Group", $0.group))
            .position(by: .value("Group", $0.group)) // группировка рядом
        }
        .padding()
        .frame(height: 250)
        .dynamicTypeSize(.xLarge)
    }
}

// MARK: - Preview
#Preview {
    Chart_BarMarkPositionBy()
}
