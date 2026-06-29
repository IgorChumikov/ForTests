//
//  CustomAlertView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.05.2024.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var isPresented: Bool

    var body: some View {
        EmptyView()
            .alert(isPresented: $isPresented) {
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

#Preview {
    CustomAlertView(isPresented: .constant(false))
}
