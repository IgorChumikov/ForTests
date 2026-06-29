//
//  Menu_Customizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Menu — кастомизация кнопки вызова меню (iOS 14+)

 • Menu поддерживает параметр label, в который можно передать любую вёрстку:
   текст, иконки, стеки, карточки, градиенты и даже целые композиции.
 • Это позволяет делать меню визуально уникальным и полностью кастомным.
 • Само содержимое меню остаётся системным, а вот кнопка вызова может выглядеть как угодно.
 • Подходит для инструментов редактирования, контекстных действий и панелей опций.
 */


import SwiftUI

struct Menu_Customizing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "Menu",
                subtitle: "Customizing",
                desc: "The label parameter can be any composition of views.",
                back: .blue,
                textColor: .white
            )
            
            Spacer()
            
            Menu {
                Button(action: {}) {
                    Text("Add color")
                    Image(systemName: "eyedropper.full")
                }
                
                Button(action: {}) {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Change contrast")
                }
                
                Button(action: {}) {
                    Text("Skew")
                    Image(systemName: "skew")
                }
            } label: {
                VStack(spacing: 16) {
                    Image(systemName: "paintbrush.pointed.fill")
                    Text("Editing Options")
                }
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                )
            }
            
            Spacer()
        }
        .font(.title)
    }
}


#Preview {
    Menu_Customizing()
}


import SwiftUI

struct HeaderView3: View {
    // MARK: - Properties
    var title: String
    var subtitle: String
    var desc: String
    var back: Color
    var textColor: Color
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(textColor)
            
            Text(subtitle)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(textColor.opacity(0.85))
            
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(textColor.opacity(0.8))
                .padding(.horizontal)
        }
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity)
        .background(back.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5, y: 3)
        .padding(.horizontal)
    }
}
