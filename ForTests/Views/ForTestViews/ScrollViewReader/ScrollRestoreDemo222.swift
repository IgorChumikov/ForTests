//
//  ScrollRestoreDemo222.swift
//  ForTests
//
//  Created by Игорь Чумиков on 22.09.2025.
//

import SwiftUI

// MARK: - Модель

struct MyItem2222: Identifiable {
    var id: String { name }
    let name: String
}

struct ScrollRestoreDemo222: View {
    let items = (1...100).map { MyItem2222(name: "Item \($0)") }
    let targetItem = "Item 50"

    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Scroll to Item 50") {
                    if let item = items.first(where: { $0.name == targetItem }) {
                        proxy.scrollTo(item.id, anchor: .top)
                    }
                }
                .padding()

                List {
                    ForEach(items) { item in
                        Text(item.name)
                            .id(item.id) // Присваиваем id элементу
                            .onAppear {
                               print("item.id \(item.id)")
                            }
                    }
                }
                
            
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ScrollRestoreDemo222()
}
