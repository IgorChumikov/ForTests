////
////  FruitListView.swift
////  ForTests
////
////  Created by Игорь Чумиков on 22.11.2024.
////
//
//import SwiftUI
//
//struct Fruit: Identifiable {
//    let id = UUID()
//    let name: String
//}
//
//class FruitListViewModel: ObservableObject {
//    @Published var fruits = [
//        Fruit(name: "Яблоко"),
//        Fruit(name: "Банан"),
//        Fruit(name: "Апельсин"),
//        Fruit(name: "Груша"),
//        Fruit(name: "Манго"),
//        Fruit(name: "Киви"),
//        Fruit(name: "Ананас"),
//        Fruit(name: "Виноград")
//    ]
//    
//    @Published var searchText = ""
//    
//    var filteredFruits: [Fruit] {
//        if searchText.isEmpty {
//            return fruits
//        } else {
//            return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
//        }
//    }
//}
//
//// Создаем enum для идентификации экрана
//enum FruitListScreen: Hashable {
//    case search
//}
//
//struct FruitListView: View {
//    @StateObject private var viewModel = FruitListViewModel()
//    @State private var searchPath = NavigationPath()
//    
//    var body: some View {
//        NavigationStack(path: $searchPath) {
//            VStack {
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                    Text("Поиск фруктов...")
//                        .foregroundColor(.gray)
//                    Spacer()
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .padding()
//                .onTapGesture {
//                    // Добавляем экран поиска в путь навигации
//                    searchPath.append(FruitListScreen.search)
//                }
//                
//                List(viewModel.fruits) { fruit in
//                    Text(fruit.name)
//                }
//            }
//            .navigationTitle("Фрукты")
//            .navigationDestination(for: FruitListScreen.self) { screen in
//                switch screen {
//                case .search:
//                    FruitSearchView(viewModel: viewModel)
//                }
//            }
//        }
//    }
//}
//
//struct FruitSearchView: View {
//    @ObservedObject var viewModel: FruitListViewModel
//    @Environment(\.dismiss) private var dismiss
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(.gray)
//                TextField("Поиск фруктов...", text: $viewModel.searchText)
//                    .textFieldStyle(PlainTextFieldStyle())
//                
//                if !viewModel.searchText.isEmpty {
//                    Button(action: {
//                        viewModel.searchText = ""
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundColor(.gray)
//                    }
//                }
//            }
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//            .padding()
//            
//            List(viewModel.filteredFruits) { fruit in
//                Text(fruit.name)
//            }
//        }
//        .navigationTitle("Поиск")
//        .navigationBarTitleDisplayMode(.inline)
//        .onDisappear {
//            // Очищаем поисковый запрос при закрытии экрана
//            viewModel.searchText = ""
//        }
//    }
//}
//
//#Preview {
//    FruitListView()
//}
