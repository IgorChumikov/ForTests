//
//  GroupBox_WithLabel.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

 /*
  GroupBox — визуальная группировка связанных элементов (iOS 14+)

  • Позволяет объединять элементы интерфейса в логические секции с рамкой и заголовком.
  • Имеет два варианта инициализации:
       – GroupBox("Title") { content } — простой текстовый заголовок.
       – GroupBox { content } label: { customLabel } — кастомный label c любым стилем.
  • Отлично подходит для форм, настроек, профиля, логина и структурированной информации.
  • Заголовок по умолчанию выравнивается по leading, но можно задать любой layout.
  */

import SwiftUI

struct GroupBox_WithLabel: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 36) {
            
            // 1️⃣ GroupBox с простым текстовым заголовком
            GroupBox("Login (Default text format)") {
                VStack(alignment: .leading, spacing: 12) {
                    Text("You can create a GroupBox with a string for a title.\n(Note: This is leading aligned by default.)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.top, 8)
            }
            
            // 📝 2️⃣ GroupBox с кастомным лейблом
            GroupBox {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notice this initializer has a separate closure for the label to allow for custom text formatting.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    TextField("New Password", text: $username)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Confirm Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.top, 8)
            } label: {
                Text("Reset Password")
                    .font(.largeTitle.width(.compressed).weight(.heavy))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    GroupBox_WithLabel()
}

