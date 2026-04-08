/*
 Alert — базовое использование (iOS 15+)

 • Используем @State переменную для управления показом
 • При значении true — Alert появляется
 • После закрытия автоматически становится false
 • Если не указать кнопки — добавится стандартная "OK"
*/

import SwiftUI

struct Alerts_Intro: View {
    
    // MARK: - Properties
    @State private var showAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Text("Alerts")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)
            
            Button("Show Alert") {
                showAlert = true
            }
            
            Spacer()
        }
        .alert("Alert!", isPresented: $showAlert) {
            // кнопки не заданы → будет OK
        }
        .font(.title)
    }
}

#Preview {
    Alerts_Intro()
}
