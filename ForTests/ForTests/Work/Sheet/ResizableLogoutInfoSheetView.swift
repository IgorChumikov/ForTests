//
//  ResizableLogoutInfoSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.06.2024.
//

import SwiftUI

// MARK: - ResizableLogoutInfoSheetView

struct ResizableLogoutInfoSheetView: View {
    // MARK: - Properties
    
    private var profiles: [String] {
        [
            "Бухгалтерия и финансы в коммерческой организации",
            "Юриспруденция",
            "Специалист по закупкам",
            "Руководитель",
            "Студент или преподаватель"
        ]
    }
    
    var action: () -> Void
    @State private var isPresented: Bool = false
    
    // MARK: - Content
    
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading, spacing: .zero) {
                closeButton
                heading
                textInfo
                    .padding(.bottom, 30)
                loginButton
            }
            .padding(.horizontal, 16)
        }
    }
    
    // MARK: - Views
    
    private var background: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
    }
    
    private var closeButton: some View {
        Button(action: action) {
            Text("Отмена")
                .padding(.top, 4)
                .padding(.bottom, 10)
        }
    }
    
    private var heading: some View {
        Text("Ваш профиль")
            .font(.callout)
                   .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 24)
    }
    
    private var textInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(profiles.indices, id: \.self) { index in
                HStack(alignment: .center, spacing: 6) {
                    Text(profiles[index])
                        .lineLimit(3)
                    Spacer()
                    Circle()
                        .stroke(Color.blue, lineWidth: 1)
                        .frame(width: 16, height: 16)
                }
                if index != profiles.indices.last {
                    Divider()
                        .background(Color.black)
                        .padding(.vertical, 11)
                        .padding(.horizontal, -16)
                }
            }
        }
    }
    
    private var loginButton: some View {
        Button {
            action()
        } label: {
            Text("Закрыть")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

// MARK: - ResizableLogoutInfoSheetView_Preview

struct ResizableLogoutInfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableLogoutInfoSheetView(
            action: {}
        )
    }
}




//VStack(spacing: 20) {
//          // Кружок заполненный цветом
//          Circle()
//              .fill(Color.blue)
//              .frame(width: 100, height: 100)
//
//          // Кружок с обводкой
//          Circle()
//              .stroke(Color.blue, lineWidth: 4)
//              .frame(width: 100, height: 100)
//      }
