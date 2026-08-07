//
//  TextField_LineLimit.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — ограничение количества строк (iOS 16+)

 • Позволяет задать минимальное и максимальное количество строк.
 • Работает только при axis: .vertical.
 • При lineLimit(0) — без ограничений.
*/

import SwiftUI

struct TextField_LineLimit: View {
    // MARK: - Properties
    @State private var text = "This is some longer text that will cause the text fields to scroll text."

    // MARK: - Body
    var body: some View {
        VStack(spacing: 24) {
            // Без ограничений
            TextField("Enter Name", text: $text, axis: .vertical)
                .lineLimit(0)

            // Без указания axis не будет увеличения по высоте
            TextField("Enter Name", text: $text)
                .lineLimit(2)

            // 2 строки максимум
            TextField("Enter Name", text: $text, axis: .vertical)
                .lineLimit(2)

            // До 3 строк
            TextField("Enter Name", text: $text, axis: .vertical)
                .lineLimit(3)

            // До 4 строк
            TextField("Enter Name", text: $text, axis: .vertical)
                .lineLimit(4)

            // Диапазон строк: минимум 4, максимум 8
            TextField("Enter Name", text: $text, axis: .vertical)
                .lineLimit(4...8)
        }
        .textFieldStyle(.roundedBorder)
        .font(.title3)
        .padding()
    }
}

#Preview {
    TextField_LineLimit()
}
