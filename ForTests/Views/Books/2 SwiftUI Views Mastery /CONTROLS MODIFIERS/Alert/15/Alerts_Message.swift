/*
 Alert — сообщение (iOS 15+)

 • Можно добавить message через отдельный closure
 • Если не задать кнопки — появится стандартная "OK"
 • Модификаторы (font, color) не влияют на текст в Alert
*/

import SwiftUI

struct Alerts_Message: View {
    
    // MARK: - Properties
    @State private var showAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Text("Alerts")
                .font(.largeTitle)
            
            Text("Message")
                .font(.title)
                .foregroundStyle(.gray)
            
            Button("Show Alert") {
                showAlert = true
            }
            
            Spacer()
        }
        .alert("Congratulations!", isPresented: $showAlert) {
            // кнопки не заданы → будет OK
        } message: {
            Text("Your trip is now booked.")
                .font(.largeTitle)
                .foregroundStyle(.red)
        }
        .font(.title)
    }
}

#Preview {
    Alerts_Message()
}
