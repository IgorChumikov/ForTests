//
//  Navigation_Searchable_Search.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Navigation — searchable (iOS 15+)
 
 • Модификатор `.searchable(text:)` добавляет строку поиска в навигационную панель.
 • Можно связывать текст поиска с состоянием через `@State`.
 • С помощью trailing closure можно выводить динамические результаты.
 • Идеально подходит для фильтрации данных, поиска городов, товаров и т. д.
 
 */

import SwiftUI

struct Navigation_Searchable_Search: View {
    private let locations = [
        "Milton", "Milltown", "Millerville", "Milwaukee",
        "Millcreek", "Milagro", "Milano"
    ]
    
    @State private var searchResults: [String] = []
    @State private var locationSearch = ""
    @State private var destination = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Where do you want to go?")
                Text(destination)
                    .fontWeight(.bold)
                
                Spacer()
                
                HeaderView3(
                    title: "",
                    subtitle: "Searchable",
                    desc: "Use searchable to add a text field to the navigation bar drawer.",
                    back: .blue,
                    textColor: .white
                )
            }
            .font(.title)
            .navigationTitle("Navigation")
        }
        // MARK: 1️⃣ Добавляем searchable
        .searchable(text: $locationSearch) {
            // MARK: 2️⃣ Отображаем результаты
            ForEach(searchResults, id: \.self) { name in
                Button(name) {
                    // MARK: 3️⃣ Обработка выбора
                    destination = name
                }
            }
        }
        // MARK: Обновление при изменении текста поиска
        .onChange(of: locationSearch) { _, location in
            searchResults = locations.filter { name in
                name.localizedCaseInsensitiveContains(location)
            }
        }
    }
}

#Preview {
    Navigation_Searchable_Search()
}
