//
//  Gauge_CircularSize.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

import SwiftUI

struct Gauge_CircularSize: View {
    @State private var progress = 0.25
    
    var body: some View {
        VStack(spacing: 60) {
            
            // 🟠 1. Масштабированный Gauge с текстом внутри
            Gauge(value: progress) {
                Text("Level")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.orange)
            .scaleEffect(4)
            .frame(width: 250, height: 200)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("You can use the scale effect to increase the size of the gauge,")
                Text("but the text inside becomes blurred because it scales as an image.")
            }
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            // 🔶 2. Gauge с наложенным текстом для четкости
            Gauge(value: progress, label: { })
                .gaugeStyle(.accessoryCircular)
                .tint(.orange)
                .scaleEffect(4)
                .frame(width: 250, height: 200)
                .overlay(alignment: .bottom) {
                    Text("Level")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.bottom, 12)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("For sharper text, overlay a separate Text view on top of the scaled gauge.")
                Text("This way the label stays crisp even at large scales.")
            }
            .font(.body)
            .foregroundColor(.secondary)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Gauge_CircularSize()
}
