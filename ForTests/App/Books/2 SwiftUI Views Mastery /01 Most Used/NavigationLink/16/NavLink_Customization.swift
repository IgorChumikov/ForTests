//
//  NavLink_Customization.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationLink (iOS 16+) можно настраивать так же, как и Button —
используя модификаторы `.buttonStyle`, `.tint`, `.foregroundStyle` и т.д.
 
 • Внутренний замыкатель (`label:`) позволяет создавать полностью кастомный вид.
 • Внутри можно размещать любые вью, включая `LabeledContent`, `HStack`, иконки и тексты.
 • Как и у кнопки, содержимое внутри `NavigationLink` будет плавно "затемняться" при нажатии.
 
 */

import SwiftUI

struct NavLink_Customization: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Простой NavigationLink, оформленный как кнопка
                NavigationLink(destination: SecondView()) {
                    Text("Navigate")
                        .foregroundStyle(.white)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                
                // Кастомный label с иконкой
                NavigationLink(destination: SecondView()) {
                    LabeledContent("Navigate") {
                        Image(systemName: "chevron.right")
                           // .foregroundStyle(.accentColor)
                    }
                    .padding()
                }
            }
            .navigationTitle("NavigationLink")
        }
        .font(.title)
    }
}

#Preview {
    NavLink_Customization()
}
