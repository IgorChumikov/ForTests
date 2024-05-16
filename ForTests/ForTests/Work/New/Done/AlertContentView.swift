//
//  AlertContentView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2024.
//

import SwiftUI

struct AlertContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button("Показать алерт") {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Подтверждение выхода")
                    .fontWeight(.bold),
                message: Text("После выхода вы продолжите пользоваться некоммерческой версией приложения КонсультантПлюс без доступа к документам из вашего комплекта.\nДля повторного входа в коммерческую версию приложения необходимо получить ссылку в онлайн-версии системы."),
                primaryButton: .default(Text("Остаться"), action: {
                    showAlert = false
                }),
                secondaryButton: .destructive(Text("Выйти").fontWeight(.bold), action: {
                    showAlert = false
                })
            )
        }
    }
}

#Preview {
    AlertContentView()
}
