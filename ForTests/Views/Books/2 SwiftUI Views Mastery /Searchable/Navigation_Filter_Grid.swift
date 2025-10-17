//
//  Navigation_Filter_Grid.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Navigation_Filter_Grid — Using .searchable with a grid layout (iOS 15+)
 
 • Демонстрирует, как использовать `.searchable` для фильтрации
   элементов в сетке (`LazyVGrid`) внутри `ScrollView`.
 • Свойство `searchResults` вычисляет, какие данные отображать —
   все или только отфильтрованные.
 • Модификатор `.animation(.default, value: searchText)` добавляет
   плавную анимацию при изменении результатов поиска.
 • Когда `.searchable` используется со скроллируемыми контейнерами,
   поле поиска скрыто по умолчанию — его нужно потянуть вниз,
   чтобы показать.
 
 */

import SwiftUI

struct Navigation_Filter_Grid: View {
    // MARK: - Properties
    @State private var devs: [Developer] = []
    @State private var searchText = ""
    
    // MARK: - Computed Property
    private var searchResults: [Developer] {
        if searchText.isEmpty {
            return devs
        } else {
            return devs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // MARK: - Grid Content
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]) {
                        ForEach(searchResults) { dev in
                            Image(dev.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
                .animation(.default, value: searchText)
                
                // MARK: - Header
                HeaderView(
                    "",
                    subtitle: "Filter - Grid",
                    desc: "Notice when used with scrolling views, you have to pull down to show the searchable text field."
                )
            }
            .searchable(text: $searchText, prompt: Text("Filter"))
            .navigationTitle("Navigation")
            .task {
                devs = getDevelopers()
            }
        }
    }
}

// MARK: - Supporting Models
struct Developer: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

// MARK: - Mock Data
private func getDevelopers() -> [Developer] {
    [
        Developer(name: "Денис", image: "profile1"),
        Developer(name: "Марк", image: "profile2"),
        Developer(name: "Стив", image: "profile3"),
        Developer(name: "Оля", image: "profile4"),
        Developer(name: "Света", image: "profile5"),
        Developer(name: "Paola", image: "profile6"),
        Developer(name: "Roxy", image: "profile7"),
        Developer(name: "Marry", image: "profile8"),
        Developer(name: "Elaine", image: "profile9"),
        Developer(name: "Matthew", image: "profile10"),
        Developer(name: "John", image: "profile11"),
        Developer(name: "Josephine", image: "profile12")
    ]
}

#Preview {
    Navigation_Filter_Grid()
}
