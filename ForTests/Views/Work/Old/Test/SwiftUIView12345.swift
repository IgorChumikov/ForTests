//
//  SwiftUIView12345.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.01.2024.
//

import SwiftUI

struct SwiftUIView12345: View {
    @State private var activationCode: String = ""
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                VStack(alignment: .leading) {
                    Text("Вход в систему КонсультантПлюс")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.bottom,20)
                    Text("СМС-сообщение с кодом активации отправлено на номер +7 (911) 125-78-34.")
                        .font(.system(size: 16, weight: .medium))
                        .padding(.bottom, 20)
                    Text("Сообщение придет в течение 15 минут.")
                        .font(.system(size: 16, weight: .medium))
                        .padding(.bottom, 20)
                    TextField("Код активации", text: $activationCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                       // .padding(.horizontal, -16)
                    
                    
                }
                VStack {
                    Button("Активировать") {}
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    Button("Изменить номер телефона") {}
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                    Text("Не пришло СМС сообщение?")
                    .font(.system(size: 16, weight: .medium))
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SwiftUIView12345()
}
