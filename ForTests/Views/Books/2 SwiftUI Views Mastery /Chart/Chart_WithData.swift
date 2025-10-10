//
//  Chart_WithData.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import SwiftUI
import Charts

struct Chart_WithData: View {
    @State private var data = [75, 25, 100, 50]

    var body: some View {
        Chart(data, id: \.self) { datum in
            BarMark(
                x: .value("Labels", "\(datum)"),
                y: .value("Values", datum)
            )
        }
        .frame(height: 200)
        .padding()
    }
}

struct Chart_WithForEach: View {
    @State private var data = [75, 25, 100, 50]

    var body: some View {
        Chart {
            ForEach(data, id: \.self) { datum in
                BarMark(
                    x: .value("Labels", "\(datum)"),
                    y: .value("Values", datum)
                )
            }
        }
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    VStack {
        Text("Chart(data, id:)")
        Chart_WithData()

        Divider().padding()

        Text("Chart + ForEach")
        Chart_WithForEach()
    }
    .padding()
}
