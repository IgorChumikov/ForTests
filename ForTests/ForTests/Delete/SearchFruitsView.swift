//
//  SearchFruitsView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 22.11.2024.
//
import SwiftUI

class FruitsViewModel: ObservableObject {
    @Published var isSearchScreenActive: Bool = false
    @Published var fruits: [String] = ["Apple", "Banana", "Orange", "Grapes", "Peach"]
    @Published var searchQuery: String = ""
    
    var filteredFruits: [String] {
        if searchQuery.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}

struct FruitsListView: View {
    @StateObject private var viewModel = FruitsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.fruits, id: \.self) { fruit in
                Text(fruit)
            }
            .navigationTitle("Fruits")
            .toolbar {
                Button(action: {
                    if !viewModel.isSearchScreenActive {
                        viewModel.isSearchScreenActive = true
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .sheet(isPresented: $viewModel.isSearchScreenActive, onDismiss: {
                viewModel.isSearchScreenActive = false
            }) {
                SearchFruitsView(viewModel: viewModel)
            }
        }
    }
}

struct SearchFruitsView: View {
    @ObservedObject var viewModel: FruitsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search fruits...", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(viewModel.filteredFruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            .navigationTitle("Search Fruits")
            .toolbar {
                Button("Close") {
                    viewModel.isSearchScreenActive = false
                }
            }
        }
    }
}

#Preview {
    FruitsListView()
}
