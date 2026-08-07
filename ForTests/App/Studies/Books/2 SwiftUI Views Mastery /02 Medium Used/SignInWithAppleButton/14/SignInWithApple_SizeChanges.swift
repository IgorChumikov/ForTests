//
//  SignInWithApple_SizeChanges.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SignInWithAppleButton — изменение размера кнопки (iOS 14+)

 • Контент кнопки автоматически подстраивается под размер frame.
 • Меньшие кнопки показывают только логотип, большие — логотип и текст.
 • Требуется импорт AuthenticationServices.
*/

import SwiftUI
import AuthenticationServices

struct SignInWithApple_SizeChanges: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("SignInWithAppleButton")
                .font(.largeTitle)

            Text("Sizing")
                .font(.title)
                .foregroundStyle(.gray)

            Text("You will notice that the button content will visually change depending on the size you give it.")

            VStack(spacing: 20) {
                SignInWithAppleButton(.signIn,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(width: 50, height: 50)

                SignInWithAppleButton(.continue,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(width: 100, height: 100)

                SignInWithAppleButton(.signIn,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(width: 200, height: 50)

                SignInWithAppleButton(.signIn,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(height: 150)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

#Preview {
    SignInWithApple_SizeChanges()
}
