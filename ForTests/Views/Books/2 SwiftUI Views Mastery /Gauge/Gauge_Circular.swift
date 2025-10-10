//
//  Gauge_Circular.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

import SwiftUI

struct Gauge_Circular: View {
    @State private var progress = 0.25
    
    var body: some View {
        VStack(spacing: 50) {
            
            // 🌀 1. Базовый круговой Gauge
            Gauge(value: progress, label: { })
                .gaugeStyle(.accessoryCircular)
            
            // 🟠 2. Круговой Gauge с текстовой меткой и цветом
            Gauge(value: progress) {
                Text("Level")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.orange)
            
            // 🔴 3. Круговой Gauge с контейнером (capacity)
            Gauge(value: progress) {
                Text("Level")
                    .padding(5)
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.red)
            
            // 📖 Описание
            VStack(alignment: .leading, spacing: 8) {
                Text("Circular gauges are smaller and often used as compact, inline indicators.")
                Text("By default, they use the primary color, but you can use `.tint()` to customize.")
            }
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            Spacer()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Gauge_Circular()
}
