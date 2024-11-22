//
//  DO11111123ffffff.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.11.2024.
//

import SwiftUI

struct DO11111123ffffff: View {
    @State private var searchQuery: String = ""
    @State private var isSearchScreenPresented: Bool = false
    @State private var filteredItems: [String]? = nil
    
    private let allItems = Array(1...10).map { "Лист \($0)" }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarButton {
                    isSearchScreenPresented = true
                }
                
                List(filteredItems ?? allItems, id: \.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("Результаты поиска")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Назад") {
                        filteredItems = nil
                        isSearchScreenPresented = false
                    }
                }
            }
            .sheet(isPresented: $isSearchScreenPresented) {
                SearchScreen(searchQuery: $searchQuery,
                             onSearch: { query in
                                 filteredItems = query.isEmpty ? nil : allItems.filter { $0.contains(query) }
                                 isSearchScreenPresented = false
                             },
                             onBack: {
                                 filteredItems = nil
                                 isSearchScreenPresented = false
                             })
            }
        }
    }
}

struct SearchBarButton: View {
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text("Нажмите для поиска...")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

struct SearchScreen: View {
    @Binding var searchQuery: String
    var onSearch: (String) -> Void
    var onBack: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите запрос", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Поиск") {
                    onSearch(searchQuery)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Поиск")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Назад") {
                        onBack()
                    }
                }
            }
        }
    }
}

#Preview {
    DO11111123ffffff()
}
