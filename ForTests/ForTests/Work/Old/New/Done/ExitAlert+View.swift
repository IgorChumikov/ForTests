//
//  ExitAlert+View.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

// Расширение для View, добавляющее функцию отображения алерта
extension View {
    func exitAlert(isPresented: Binding<Bool>) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(
                title: Text("Подтверждение выхода")
                    .fontWeight(.bold),
                message: Text("После выхода вы продолжите пользоваться некоммерческой версией приложения КонсультантПлюс без доступа к документам из вашего комплекта.\nДля повторного входа в коммерческую версию приложения необходимо получить ссылку в онлайн-версии системы."),
                primaryButton: .default(Text("Остаться"), action: {
                    isPresented.wrappedValue = false
                }),
                secondaryButton: .destructive(Text("Выйти").fontWeight(.bold), action: {
                    isPresented.wrappedValue = false
                })
            )
        }
    }
}
