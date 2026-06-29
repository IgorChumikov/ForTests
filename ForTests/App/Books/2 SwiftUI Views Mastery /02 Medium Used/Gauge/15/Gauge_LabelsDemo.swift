//
//  Gauge_LabelsDemo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 Gauge — работа с подписями (labels) и отображением значений (iOS 15+)

 • Gauge поддерживает несколько типов подписей:
      – currentValueLabel — текущее значение (число внутри или под шкалой).
      – minimumValueLabel / maximumValueLabel — подписи для границ диапазона.
      – markedValueLabels — промежуточные метки (не все стили их отображают).

 • Разные gauge-стили по-разному показывают подписи:
      – accessoryCircular / accessoryCircularCapacity — currentValueLabel отображается внутри круга.
      – linear / linearCapacity — показывают подписи под шкалой или по бокам.
      – accessoryLinear — минимальные/максимальные подписи могут быть заменены иконками.

 • Используйте форматирование через .number или SF Symbols для более гибких подписей.
 */


import SwiftUI

struct Gauge_LabelsDemo: View {
    @State private var value: Double = 42
    
    var body: some View {
        VStack(spacing: 60) {
            
            // 1️⃣ Базовый Gauge с currentValueLabel (число под шкалой)
            Gauge(value: value) {
                Text("Range")
            } currentValueLabel: {
                Text(value, format: .number) // число под gauge
            } markedValueLabels: {
                Text("Not currently used")
            }
            
            // 2️⃣ Круговой Gauge с числом внутри шкалы
            Gauge(value: value) {
                Text("Range")
            } currentValueLabel: {
                Text(value, format: .number) // число внутри gauge
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.blue)
            
            // 3️⃣ Линейный Gauge с подписями мин/макс
            Gauge(value: value, in: 0...100) {
                Text("Range")
            } currentValueLabel: {
                Text(value, format: .number) // число под gauge
            } minimumValueLabel: {
                Text(0, format: .number) // слева
            } maximumValueLabel: {
                Text(100, format: .number) // справа
            }
            .tint(.green)
            
            // 4️⃣ Линейный Gauge с иконками вместо чисел
            Gauge(value: value, in: 0...100) {
                Text("Range") // не отображается в accessoryLinear
            } currentValueLabel: {
                Text(value, format: .number) // не отображается в accessoryLinear
            } minimumValueLabel: {
                Image(systemName: "circle") // слева
            } maximumValueLabel: {
                Image(systemName: "circle.fill") // справа
            }
            .gaugeStyle(.accessoryLinear)
            .tint(.orange)
            
            Spacer()
        }
        .padding()
        .font(.title3)
    }
}

#Preview {
    Gauge_LabelsDemo()
}
