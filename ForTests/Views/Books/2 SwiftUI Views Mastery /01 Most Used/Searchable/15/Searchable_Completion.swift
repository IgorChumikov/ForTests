//
//  Searchable_Completion.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Searchable_Completion — Using .searchCompletion to fill search field (iOS 15+)
 
 • Модификатор `.searchCompletion` позволяет связать представление (например, HStack)
   с текстом, который будет вставлен в поле поиска при нажатии на элемент.
 • В этом примере при выборе “Home” или “Work” в поле поиска подставляется
   соответствующий адрес.
 • Можно добавлять как заранее заданные варианты поиска, так и недавние запросы.
 • Работает совместно с `.searchable(text:)`, упрощая ввод пользователем
   часто используемых значений.
 
 */

import SwiftUI

struct Searchable_Completion: View {
    // MARK: - Properties
    @State private var locationSearch = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                // MARK: - Header
                HeaderView(
                    "Searchable",
                    subtitle: "Completion",
                    desc: "Tap on a suggested location to automatically fill the search field."
                )
            }
            .font(.title2)
            .navigationTitle("Searchable")
        }
        // MARK: - Search Suggestions
        .searchable(text: $locationSearch) {
            Group {
                HStack {
                    Image(systemName: "house.circle")
                        .font(.largeTitle)
                    Text("Home")
                }
                .searchCompletion("123 Main Street, Salt Lake City, Utah")
                
                HStack {
                    Image(systemName: "building.2.crop.circle")
                        .font(.largeTitle)
                    Text("Work")
                }
                .searchCompletion("456 State Street, Salt Lake City, Utah")
            }
            .font(.title2)
            .tint(.primary)
            .padding(.vertical)
        }
    }
}

#Preview {
    Searchable_Completion()
}
