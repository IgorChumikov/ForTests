//
//  TextField_Border.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — границы (iOS 14+)

 • Модификатор .border(_:width:) добавляет границу к TextField.
 • Можно использовать цвет, материал (iOS 15+) или градиент как стиль границы.
 • Материалы (.ultraThickMaterial, .thinMaterial и др.) появились в iOS 15.
 • Отлично подходит для выделения активных полей ввода.
*/

import SwiftUI

struct TextField_Border: View {
    // MARK: - Properties
    @State private var textFieldData = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextField",
                subtitle: "Border",
                desc: "Use the border modifier to apply a ShapeStyle to the border of the text field.",
                back: .orange,
                textColor: .white
            )

            Group {
                // Простая цветная граница
                TextField("Data", text: $textFieldData)
                    .padding(5)
                    .border(Color.orange)

                // Материал (iOS 15+)
                TextField("Data", text: $textFieldData)
                    .padding(5)
                    .border(.ultraThickMaterial, width: 4)

                // Предустановленный системный цвет
                TextField("Data", text: $textFieldData)
                    .padding(5)
                    .border(.tertiary, width: 5)

                // Градиентная рамка
                TextField("Data", text: $textFieldData)
                    .padding(5)
                    .border(
                        LinearGradient(
                            colors: [.orange, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        width: 5
                    )
            }
            .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_Border()
}
