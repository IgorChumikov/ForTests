//
//  Link_ButtonStyles.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 Link — стилизация под кнопку (iOS 15+)

 • Начиная с iOS 15, Link можно оформлять так же, как и Button.
 • Поддерживаются все стандартные модификаторы:
      – .buttonStyle(.bordered / .borderedProminent / .plain / кастомные)
      – .buttonBorderShape(.capsule, .roundedRectangle, .automatic)
      – .controlSize(.mini / .small / .regular / .large)
      – .tint(...) для изменения цвета заливки и акцента.
 • Благодаря этому можно делать ссылки-кнопки любого вида:
      — простые,
      — крупные,
      — залитые,
      — кастомные.
 • Удобно для CTA-ссылок: телефон, почта, сообщения, переходы на веб-страницы.
 */


import SwiftUI

struct Link_ButtonStyles: View {
    var body: some View {
        VStack(spacing: 40) {
            // 🔹 Заголовок
            HeaderView(
                "Link",
                subtitle: "Button Styles",
                desc: "You can use any of the same styling options that you also use on buttons."
            )
            
            // 1️⃣ Обычная ссылка с .bordered стилем
            Link("Go to Apple", destination: URL(string: "https://www.apple.com")!)
                .buttonStyle(.bordered)
            
            // 2️⃣ Ссылка с формой капсулы и крупным размером
            Link("Call Now", destination: URL(string: "tel:8005551234")!)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            
            // 3️⃣ Ссылка с заливкой, кастомной формой и цветом
            Link("Email Me", destination: URL(string: "mailto:myemail@swiftui.com")!)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
                .tint(.mint)
            
            // 4️⃣ Ещё одна залитая кнопка-ссылка
            Link("Message Me", destination: URL(string: "sms:+18885551212&body=Hello")!)
                .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Link_ButtonStyles()
}
