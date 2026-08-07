//
//  Toggle_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Toggle — базовое использование (iOS 14+)

 • Это "push-out" элемент, который занимает всю ширину родителя.
 • Цвет переключателя задаётся через .tint(), а не через .accentColor().
 • Можно объединять текст и изображения внутри Toggle.
*/

import SwiftUI

struct Toggle_Intro: View {
    // MARK: - Properties
    @State private var isToggleOn = true

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "Toggle",
                subtitle: "Introduction",
                desc: "The Toggle is a ‘push-out view’ that only pushes out to fill the width of its parent view.",
                back: .brown,
                textColor: .white
            )

            // MARK: - Простой пример
            Toggle("Night Mode", isOn: $isToggleOn)
                .padding()
                .accentColor(.red) // ⚠️ Не влияет на цвет переключателя!

            DescView(desc: "Combine images with text")

            // MARK: - Toggle с кастомным содержимым
            Toggle(isOn: $isToggleOn) {
                Text("Night Mode")
                Image(systemName: "moon")
            }
            .padding()

            DescView(desc: "Or you can have nothing")

            // MARK: - Toggle внутри кнопочного контейнера
            VStack {
                Text("Turn Alarm On?")
                    .foregroundStyle(.white)
                Toggle("Turn this alarm on", isOn: $isToggleOn)
                    .labelsHidden() // скрывает подпись
                    .tint(.green)
            }
            .padding(25)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Toggle_Intro()
}
