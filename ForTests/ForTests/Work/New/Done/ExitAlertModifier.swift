//
//  ExitAlertModifier.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

// Модификатор для отображения алерта
struct ExitAlertModifier: ViewModifier {
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        content.alert(isPresented: $isPresented) {
            Alert(
                title: Text("Подтверждение выхода")
                    .fontWeight(.bold),
                message: Text("После выхода вы продолжите пользоваться некоммерческой версией приложения КонсультантПлюс без доступа к документам из вашего комплекта.\nДля повторного входа в коммерческую версию приложения необходимо получить ссылку в онлайн-версии системы."),
                primaryButton: .default(Text("Остаться"), action: {
                    isPresented = false
                }),
                secondaryButton: .destructive(Text("Выйти").fontWeight(.bold), action: {
                    isPresented = false
                })
            )
        }
    }
}

// Расширение для View, добавляющее модификатор
extension View {
    func exitAlert1(isPresented: Binding<Bool>) -> some View {
        self.modifier(ExitAlertModifier(isPresented: isPresented))
    }
}
