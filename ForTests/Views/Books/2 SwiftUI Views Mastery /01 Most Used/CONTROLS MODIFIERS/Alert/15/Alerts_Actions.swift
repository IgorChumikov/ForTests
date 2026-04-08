/*
 Alert — действия (кнопки) (iOS 15+)

 • Можно добавлять кнопки через closure
 • Используем Button с role (например: .destructive)
 • Если есть destructive — система добавит Cancel автоматически
*/

import SwiftUI

struct Alerts_Actions: View {
    
    // MARK: - Properties
    @State private var showAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Text("Alerts")
                .font(.largeTitle)
            
            Text("Actions")
                .font(.title)
                .foregroundStyle(.gray)
            
            Button("Show Alert") {
                showAlert = true
            }
            
            Spacer()
        }
        .alert("Delete Contact?", isPresented: $showAlert) {
            
            Button(role: .destructive) {
                // Delete action
            } label: {
                Text("Delete")
            }
            
        } message: {
            Text("This will permanently delete the contact.")
        }
        .font(.title)
    }
}

#Preview {
    Alerts_Actions()
}
