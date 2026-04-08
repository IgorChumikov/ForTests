//
//  Text_Currency.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — форматирование валюты (iOS 15+)

 • Используем .currency(code:) для отображения суммы с нужным символом валюты.
 • Можно задать код вручную или получить автоматически из локали пользователя.
*/

import SwiftUI

struct Text_Currency: View {

    @Environment(\.locale) private var locale
    @State private var amount = 36.72

    var body: some View {
        VStack(spacing: 10) {
            // Разные валютные коды
            Text(amount, format: .currency(code: "USD"))  // $
            Text(amount, format: .currency(code: "EUR"))  // €
            Text(amount, format: .currency(code: "BRL"))  // R$
            Text(amount, format: .currency(code: "GBP"))  // £
            Text(amount, format: .currency(code: "JPY"))  // ¥
            Text(amount, format: .currency(code: "INR"))  // ₹

            // Текущая локаль устройства
            Text(amount, format: .currency(code: locale.currency?.identifier ?? "USD"))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_Currency()
}
