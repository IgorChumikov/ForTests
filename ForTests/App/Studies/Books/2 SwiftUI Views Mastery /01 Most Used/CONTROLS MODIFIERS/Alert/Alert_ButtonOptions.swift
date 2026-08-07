/*
 Alert — варианты кнопок (iOS 14+)

 • Можно показать Alert только с заголовком
 • Можно добавить сообщение и одну кнопку
 • Можно добавить primaryButton и secondaryButton
 • Кнопка cancel обычно показывается первой
*/

import SwiftUI

struct Alert_ButtonOptions: View {
    
    // MARK: - Alert Types
     enum ActiveAlert {
        case timeout
        case message
        case confirm
        case delete
    }
    
    // MARK: - Properties
    @State private var activeAlert: ActiveAlert?
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Alert")
                .font(.largeTitle)
            
            Text("Button Options")
                .font(.title)
                .foregroundStyle(.gray)
            
            Button("Show Timeout Alert") {
                activeAlert = .timeout
            }
            
            Button("Show Message Alert") {
                activeAlert = .message
            }
            
            Button("Show Confirm Alert") {
                activeAlert = .confirm
            }
            
            Button("Show Delete Alert") {
                activeAlert = .delete
            }
            
            Spacer()
        }
        .font(.title3)
        .alert(item: Binding<AlertItem?>(
            get: {
                guard let activeAlert else { return nil }
                return AlertItem(type: activeAlert)
            },
            set: { newValue in
                activeAlert = newValue?.type
            }
        )) { item in
            switch item.type {
            case .timeout:
                return Alert(
                    title: Text("Your session has timed out")
                )
                
            case .message:
                return Alert(
                    title: Text("Title"),
                    message: Text("Message of the Alert"),
                    dismissButton: .cancel()
                )
                
            case .confirm:
                return Alert(
                    title: Text("Confirm"),
                    message: Text("Are you sure you want to continue?"),
                    primaryButton: .default(Text("Continue"), action: {
                        // Continue code
                    }),
                    secondaryButton: .cancel({
                        // Cancel code
                    })
                )
                
            case .delete:
                return Alert(
                    title: Text("Delete"),
                    message: Text("Are you sure you want to delete?"),
                    primaryButton: .destructive(Text("Delete"), action: {
                        // Delete code
                    }),
                    secondaryButton: .cancel(Text("No"), action: { })
                )
            }
        }
    }
}

// MARK: - AlertItem
private struct AlertItem: Identifiable {
    let id = UUID()
    let type: Alert_ButtonOptions.ActiveAlert
}

#Preview {
    Alert_ButtonOptions()
}
