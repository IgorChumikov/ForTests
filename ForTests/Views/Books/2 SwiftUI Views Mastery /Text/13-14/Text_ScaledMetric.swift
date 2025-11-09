//
//  Text_ScaledMetric.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 @ScaledMetric — адаптивные размеры (iOS 14+)

 • Позволяет масштабировать значения относительно Dynamic Type.
 • Работает с CGFloat и другими числовыми типами.
 • В отличие от .font(.system(size:)), значение @ScaledMetric
 само увеличивается или уменьшается в зависимости от пользовательских настроек текста.
*/

import SwiftUI

struct Text_ScaledMetric: View {
    // Это значение будет автоматически масштабироваться при изменении системного размера шрифта
    @ScaledMetric private var fontSize: CGFloat = 50

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("ScaledMetric")
                .font(.title)
                .foregroundStyle(.gray)
            Image(systemName: "textformat.size")

            // Текст с динамическим размером
            Text("Hello, World!")
                .font(.system(size: fontSize))

            // Текст с фиксированным размером
            VStack {
                Text("Not using @ScaledMetric:")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundStyle(.white)

                Text("Hello, World!")
                    .font(.system(size: 50))
            }
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Text_ScaledMetric()
}
