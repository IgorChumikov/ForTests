//
//  TextEditor_DismissKeyboard.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — скрытие клавиатуры (iOS 14+)

 • В SwiftUI нет встроенного метода для скрытия клавиатуры.
 • Решение основано на методе resignFirstResponder из UIKit.
 • Добавляем расширение View с функцией hideKeyboard().
 • Клавиатура скрывается при нажатии на кнопку с иконкой клавиатуры.
 • Источник: Paul Hudson (Hacking with Swift)
   https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield
*/

import SwiftUI

#if canImport(UIKit)
extension View {
    /// Скрывает клавиатуру, вызывая resignFirstResponder у активного поля
    func hideKeyboard100() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
#endif

struct TextEditor_DismissKeyboard: View {
    // MARK: - Properties
    @State private var text = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Dismiss the Keyboard",
                desc: "You may wonder how to dismiss the keyboard. There is no way to do it in SwiftUI but here is a solution I learned from Paul Hudson.",
                back: .pink,
                textColor: .white
            )

            VStack {
                HStack {
                    Text("Enter comments here")
                    Spacer()
                    Button {
                        self.hideKeyboard100() // скрываем клавиатуру
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }

                TextEditor(text: $text)
                    .font(.title2)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .tint(.pink)
        .padding()
    }
}

#Preview {
    TextEditor_DismissKeyboard()
}
