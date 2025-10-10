//
//  GroupBox_WithLabel.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//
/*
🧭 Что делает GroupBox

GroupBox — это контейнер SwiftUI, который группирует визуально связанные элементы.
По умолчанию он имеет тонкую рамку и заголовок (label), что делает его идеальным для форм и настроек.
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
