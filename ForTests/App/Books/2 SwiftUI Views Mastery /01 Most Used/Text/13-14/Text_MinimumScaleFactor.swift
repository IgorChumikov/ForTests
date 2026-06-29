//
//  Text_MinimumScaleFactor.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — минимальный коэффициент масштабирования (iOS 13+)

 • Позволяет автоматически уменьшать размер текста, если он не помещается.
 • Значение от 0 до 1.
 • Работает только при .lineLimit(1)
*/

import SwiftUI

struct Text_MinimumScaleFactor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Minimum Scale Factor")
                .font(.largeTitle.bold())

            Group {
                Text("This text is set to a minimum scale factor of 0.6.")
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)

                Text("This text is set to a minimum scale factor of 0.7.")
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)

                Text("This text is set to a minimum scale factor of 0.8.")
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Text("This text is set to a minimum scale factor of 0.9.")
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
            }
            .truncationMode(.middle)
            .padding(.horizontal)

        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_MinimumScaleFactor()
}
