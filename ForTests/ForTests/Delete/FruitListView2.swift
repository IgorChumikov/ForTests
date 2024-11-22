//
//  FruitListView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 22.11.2024.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

class FruitListViewModel: ObservableObject {
    @Published var fruits = [
        Fruit(name: "Яблоко"),
        Fruit(name: "Банан"),
        Fruit(name: "Апельсин"),
        Fruit(name: "Груша"),
        Fruit(name: "Манго"),
        Fruit(name: "Киви"),
        Fruit(name: "Ананас"),
        Fruit(name: "Виноград")
    ]
    
    @Published var searchText = ""
    
    var filteredFruits: [Fruit] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct FruitListView: View {
    @StateObject private var viewModel = FruitListViewModel()
    @State private var isSearchPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Поисковая строка
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Text("Поиск фруктов...")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    isSearchPresented = true
                }
                
                // Список фруктов
                List(viewModel.fruits) { fruit in
                    Text(fruit.name)
                }
            }
            .navigationTitle("Фрукты")
            .fullScreenCover(isPresented: $isSearchPresented) {
                FruitSearchSheet(viewModel: viewModel, isPresented: $isSearchPresented)
            }
        }
        .transition(.move(edge: .trailing))
    }
}

struct FruitSearchSheet: View {
    @ObservedObject var viewModel: FruitListViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                // Поисковая строка
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Поиск фруктов...", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    if !viewModel.searchText.isEmpty {
                        Button(action: {
                            viewModel.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                // Список отфильтрованных фруктов
                List(viewModel.filteredFruits) { fruit in
                    Text(fruit.name)
                }
            }
            .navigationTitle("Поиск")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отмена") {
                        viewModel.searchText = ""
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    FruitListView()
}
