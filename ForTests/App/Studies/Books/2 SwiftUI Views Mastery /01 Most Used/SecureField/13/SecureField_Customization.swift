//
//  SecureField_Customization.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SecureField — кастомизация оформления (iOS 13+)

 • Можно использовать ZStack, чтобы разместить фон (например RoundedRectangle) под TextField или SecureField.
 • Альтернативно — наложить SecureField поверх другой формы с помощью .overlay.
 • Оба метода позволяют создавать кастомные стили ввода.
*/

import SwiftUI

struct SecureField_Customization: View {
    @State private var userName = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("SecureField")
                .font(.largeTitle)

            Text("Customization")
                .font(.title)
                .foregroundStyle(.gray)

            // Вариант 1 — фон под полем с помощью ZStack
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.purple)
                TextField("user name", text: $userName)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
            }
            .frame(height: 40)
            .padding(.horizontal)

            // Вариант 2 — SecureField поверх формы через overlay
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.purple)
                .overlay(
                    SecureField("password", text: $password)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                )
                .frame(height: 40)
                .padding(.horizontal)
        }
    }
}

#Preview {
    SecureField_Customization()
}
