//
//  SignInWithApple_Customizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SignInWithAppleButton — настройка внешнего вида (iOS 14+)

 • Для изменения стиля кнопки используется .signInWithAppleButtonStyle()
 • Доступны стили: .black, .whiteOutline, .white
 • Требуется импорт AuthenticationServices
*/

import SwiftUI
import AuthenticationServices

struct SignInWithApple_Customizing: View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()

            VStack(spacing: 15) {
                Text("SignInWithAppleButton")
                    .font(.largeTitle)

                Text("Customizing")
                    .font(.title)
                    .foregroundStyle(.gray)

                Text("You can customize the buttons slightly by using the signInWithAppleButtonStyle modifier that comes with the button.")

                VStack(spacing: 20) {
                    Text("black")
                    SignInWithAppleButton(.signIn,
                        onRequest: { request in },
                        onCompletion: { result in })
                    .frame(height: 50)
                    .signInWithAppleButtonStyle(.black)

                    Text("whiteOutline")
                    SignInWithAppleButton(.continue,
                        onRequest: { request in },
                        onCompletion: { result in })
                    .frame(height: 50)
                    .signInWithAppleButtonStyle(.whiteOutline)

                    Text("white")
                    SignInWithAppleButton(.signUp,
                        onRequest: { request in },
                        onCompletion: { result in })
                    .frame(height: 50)
                    .signInWithAppleButtonStyle(.white)
                    .shadow(radius: 8, y: 12)
                }
                .padding(.horizontal)
            }
        }
        .font(.title)
    }
}

#Preview {
    SignInWithApple_Customizing()
}
