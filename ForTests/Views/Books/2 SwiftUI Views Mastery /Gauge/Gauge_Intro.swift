//
//  Gauge_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
Gauge — это SwiftUI-компонент, показывающий прогресс, уровень или значение в диапазоне (по умолчанию от 0 до 1).
Это — системный элемент, используемый, например, для отображения заряда батареи, громкости, загрузки, температуры и т.п.
 */
 
import SwiftUI

struct Gauge_Intro: View {
    @State private var progress = 0.50
    
    var body: some View {
        VStack(spacing: 50) {
            // 1. Стандартный Gauge
            Gauge(value: progress) {
                Text("Default on iOS")
            }
            
            // 2. Линейный Gauge (.linearCapacity)
            Gauge(value: progress) {
                Text("linearCapacity")
            }
            .gaugeStyle(.linearCapacity)
            .tint(.purple)
            
            // 3. Компактный линейный (.accessoryLinear)
            Gauge(value: progress) {
                Text("accessoryLinear")
            }
            .gaugeStyle(.accessoryLinear)
            .tint(.pink)
            
            // 4. Компактный линейный с вместимостью (.accessoryLinearCapacity)
            Gauge(value: progress) {
                Text("accessoryLinearCapacity")
            }
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.orange)
            
            // 5. Текстовое пояснение
            VStack(alignment: .leading, spacing: 8) {
                Text("By default, the range of values on a gauge is from 0 to 1.")
                Text("So when the progress is set to 0.25, it’s 25%.")
                Text("This is the default gauge style.")
                Text("Some gauge styles don’t show the label.")
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
    Gauge_Intro()
}
