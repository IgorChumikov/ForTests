//
//  List_SafeAreaInset.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

import SwiftUI

struct List_SafeAreaInset: View {
    var body: some View {
        VStack(spacing: 0) {
            // Заголовок примера
            HeaderView(
                "List",
                subtitle: "SafeAreaInset",
                desc: "You can use this modifier to overlay a view on top of another view but also offset the content of the parent view."
            )
            
            // Список с 20 элементами
            List {
                ForEach(1..<21) { number in
                    Text("\(number)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green, in: RoundedRectangle(cornerRadius: 10))
                }
            }
            .listStyle(.plain)
            
            // Вставка внизу через safeAreaInset
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Divider()
                    Text("Total: 20")
                        .foregroundStyle(.secondary)
                }
                .background(.bar)
            }
        }
        .font(.title)
    }
}

#Preview {
    List_SafeAreaInset()
}
