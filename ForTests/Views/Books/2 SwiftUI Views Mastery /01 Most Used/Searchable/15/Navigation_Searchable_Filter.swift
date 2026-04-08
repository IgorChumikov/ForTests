//
//  Navigation_Searchable_Filter.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Navigation_Searchable_Filter — Using .searchable to filter list items (iOS 15+)
 
 • Демонстрирует, как использовать модификатор `.searchable` в SwiftUI
   для фильтрации существующего списка данных в реальном времени.
 • При вводе текста в строку поиска выполняется фильтрация массива `names`
   и отображается только список, соответствующий введённому запросу.
 • Используется `placement: .navigationBarDrawer(displayMode: .always)` —
   поле поиска остаётся видимым при прокрутке.
 • Параметр `prompt:` задаёт placeholder-текст в строке поиска.
 • Логика фильтрации реализована через `.onChange(of:)`, где `filteredNames`
   обновляется при каждом изменении `nameSearch`.
 
 */

import SwiftUI

struct Navigation_Searchable_Filter: View {
    // MARK: - Properties
    private let names = [
        "Chris", "Paul", "Scott", "Donny",
        "Antoine", "Denise", "Игорь", "Вова"
    ]
    @State private var filteredNames: [String] = []
    @State private var nameSearch = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // MARK: - List
                List(nameSearch.isEmpty ? names : filteredNames, id: \.self) { name in
                    Text(name)
                        .font(.title2)
                }
                
                // MARK: - Header
                HeaderView(
                    "",
                    subtitle: "Searchable - Filter",
                    desc: "Use searchable to filter an existing list."
                )
            }
            .navigationTitle("Navigation")
        }
        // MARK: - Search Field
        .searchable(
            text: $nameSearch,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: Text("Filter")
        )
        // MARK: - Filter Logic
        .onChange(of: nameSearch) { _, name in
            filteredNames = names.filter { name in
                name.hasPrefix(nameSearch)
            }
        }
    }
}

#Preview {
    Navigation_Searchable_Filter()
}
