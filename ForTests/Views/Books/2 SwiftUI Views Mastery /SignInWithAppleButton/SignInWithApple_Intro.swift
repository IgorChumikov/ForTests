//
//  SignInWithApple_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SignInWithAppleButton — системная кнопка входа с Apple ID (iOS 14+)

 • Импортируется из фреймворка AuthenticationServices.
 • Поддерживает стили signIn, continue и signUp.
 • Имеет два обработчика: onRequest и onCompletion.
*/

import SwiftUI
import AuthenticationServices

struct SignInWithApple_Intro: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("SignInWithAppleButton")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("This view allows you to display Apple's sign in, continue and sign up buttons.")

            VStack(spacing: 20) {
                Text("Sign In")
                SignInWithAppleButton(.signIn,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(height: 50)

                Text("Continue")
                SignInWithAppleButton(.continue,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(height: 50)

                Text("Sign Up")
                SignInWithAppleButton(.signUp,
                    onRequest: { request in },
                    onCompletion: { result in })
                .frame(height: 50)
                .shadow(radius: 8, y: 12)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

#Preview {
    SignInWithApple_Intro()
}
