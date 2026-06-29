//
//  Text_ReferenceTo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — относительная ссылка на дату (iOS 18+)

 • Новый форматер .reference(to:) позволяет показывать время относительно другой даты.
 • Автоматически форматирует и локализует текст (“20 минут назад”, “сейчас”, “через 2 дня”).
 • Работает как для прошедших, так и будущих дат.
*/

import SwiftUI

struct Text_ReferenceTo: View {
    @State private var pastDate = Date().addingTimeInterval(-20 * 60)        // 20 минут назад
    @State private var currentDate = Date()                                  // сейчас
    @State private var futureDate = Date().addingTimeInterval(2 * 24 * 60 * 60) // через 2 дня

    var body: some View {
        VStack(spacing: 24) {
            // SwiftUI сама локализует фразу
            Text(currentDate, format: .reference(to: pastDate))
            Text(currentDate, format: .reference(to: currentDate))
            Text(currentDate, format: .reference(to: futureDate))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_ReferenceTo()
}
