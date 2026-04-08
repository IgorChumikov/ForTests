//
//  Alert_PresentingWithBool.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.04.2026.
//

import SwiftUI

/*
 Alert — показ через Bool (iOS 14+)

 • Используем @State переменную для управления показом
 • При изменении значения на true — Alert появляется
 • Если не указать кнопки — добавится стандартная кнопка "OK"
*/


struct Alert_PresentingWithBool: View {
    
    // MARK: - Properties
    @State private var presentingAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Alert")
                .font(.largeTitle)
            
            Text("Presenting with Bool")
                .font(.title)
                .foregroundStyle(.gray)
            
            Button("Show Alert") {
                presentingAlert = true
            }
            
            Spacer()
        }
        .alert(isPresented: $presentingAlert) {
            Alert(title: Text("Title of the Alert"))
        }
        .font(.title)
    }
}

#Preview {
    Alert_PresentingWithBool()
}
