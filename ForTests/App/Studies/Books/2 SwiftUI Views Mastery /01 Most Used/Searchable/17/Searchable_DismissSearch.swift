//
//  Searchable_DismissSearch.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Searchable — Dismiss Search (iOS 17+)
 
 • Данный пример демонстрирует использование @Environment(\.dismissSearch)
   для закрытия строки поиска.
 • Ключевой момент: dismissSearch работает только в дочернем представлении.
 • Родитель имеет модификатор .searchable, а дочерний вызывает dismissSearch().
 
 */

import SwiftUI

struct Searchable_DismissSearch: View {
    private let locations = [
        "Milton", "Milltown", "Millerville", "Milwaukee",
        "Millcreek", "Milagro", "Milano"
    ]
    
    @State private var searchResults: [String] = []
    @State private var locationSearch = ""
    @State private var destination = ""
    
    var body: some View {
        NavigationStack {
            // Дочернее представление (может закрывать поиск)
            SearchableSubview(destination: $destination)
        }
        // MARK: - Search field
        .searchable(text: $locationSearch) {
            ForEach(searchResults, id: \.self) { name in
                Button(name) {
                    destination = name
                }
            }
        }
        // MARK: - Update search results
        .onChange(of: locationSearch) { _, newValue in
            searchResults = locations.filter { name in
                name.localizedCaseInsensitiveContains(newValue)
            }
        }
    }
}

// MARK: - Дочерний экран, где можно закрыть поиск
struct SearchableSubview: View {
    @Binding var destination: String
    @Environment(\.dismissSearch) private var dismissSearch
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Child View")
                .font(.largeTitle)
            
            Text("Destination: \(destination)")
                .font(.title2)
                .padding(.bottom)
            
            Button("Dismiss Search") {
                dismissSearch() // закрываем активную строку поиска
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Text("""
            💡 Note:
            dismissSearch() only works in a subview
            inside the NavigationStack where .searchable
            was applied on the parent.
            """)
            .multilineTextAlignment(.center)
            .padding(.top)
        }
        .padding()
        .navigationTitle("Searchable Subview")
    }
}

#Preview {
    Searchable_DismissSearch()
}
