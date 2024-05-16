//
//  SwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2024.
//

import SwiftUI

struct ResizableSheets2View: View {
    
    @State private var name: String = "Логин 4653#45745345"
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            closeButton
            // .padding(.top, 20)
                .padding(.bottom, 20)
            Text("Коммерческая версия с доступом к вашему комплекту")
                .padding(.bottom, 20)
            textField
                .padding(.bottom, 20)
            
            HStack(spacing: .zero) {
                Spacer()
                toComeInButton
                Spacer()
            }
            .padding(.bottom, 20)
        }
        .offset(y: 20)
        .padding(.horizontal, 16)
    }
    
    private var closeButton: some View {
        Button {
            action()
        } label: {
            Text("Закрыть").foregroundColor(.blue)
            // .singlelineStyle(.size16, .bold, .whiteText)
        }
    }
    
    private var textField: some View {
        TextField("Я тут", text: $name)
        //.singlelineStyle(.size17, .regular)
            .frame(height: 48)
            .padding(top: .zero, leading: 16, bottom: .zero, trailing: 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red, lineWidth: 1)
            )
    }
    
    private var toComeInButton: some View {
        Button {
            // Ваш код для действия кнопки
        } label: {
            Text("Войти").foregroundColor(.black)
            // .singlelineStyle(.size16, .bold, .whiteText)
        }
        .frame(width: 150, height: 40)
        .background(
            Color.blue
        )
        .cornerRadius(10)
    }
}

#Preview {
    ResizableSheets2View(action: {})
}
