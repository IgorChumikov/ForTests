////
////  FavoriteSwiftUIView.swift
////  ForTests
////
////  Created by Игорь Чумиков on 21.01.2025.
////
//
//import SwiftUI
//
//// MARK: - Модель данных
//struct FileFavoriteItem: Identifiable {
//    let id = UUID()
//    var name: String
//    var isFolder: Bool
//    var contents: [FileFavoriteItem] = []
//}
//
//struct FavoriteSwiftUIView: View {
//    @State private var items: [FileFavoriteItem] = [
//        FileFavoriteItem(name: "Папка 1", isFolder: true, contents: [
//            FileFavoriteItem(name: "Документ 1", isFolder: false),
//            FileFavoriteItem(name: "Документ 2", isFolder: false)
//        ]),
//        FileFavoriteItem(name: "Документ вне папки", isFolder: false),
//        FileFavoriteItem(name: "Папка 2", isFolder: true, contents: [
//            FileFavoriteItem(name: "Вложенная папка", isFolder: true, contents: [
//                FileFavoriteItem(name: "Вложенный документ", isFolder: false)
//            ])
//        ])
//    ]
//
//    var body: some View {
//        NavigationView {
//            ListView(items: $items)
//                .navigationTitle("Файлы")
//        }
//    }
//}
//
//// MARK: - Вью для отображения списка
//struct ListView: View {
//    @Binding var items: [FileFavoriteItem] // Привязка к текущему массиву
//
//    @State private var showingAddDialog = false
//    @State private var newFolderName = ""
//    @State private var activeFolder: FileFavoriteItem? = nil // Управление активным экраном
//
//    var body: some View {
//        List {
//            ForEach($items) { $item in
//                if item.isFolder {
//                    Button(action: {
//                        activeFolder = item // Устанавливаем текущую папку
//                    }) {
//                        Text("📁 \(item.name)")
//                    }
//                    .background(
//                        NavigationLink(
//                            destination: ListView(items: $item.contents),
//                            tag: item.id,
//                            selection: Binding(
//                                get: { activeFolder?.id },
//                                set: { id in
//                                    if id == nil { activeFolder = nil }
//                                }
//                            )
//                        ) {
//                            EmptyView()
//                        }
//                        .hidden()
//                    )
//                } else {
//                    Text("📄 \(item.name)")
//                }
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                    showingAddDialog = true
//                }) {
//                    Image(systemName: "folder.badge.plus") // Иконка "создать папку"
//                        .foregroundColor(.blue)
//                }
//            }
//        }
//        .sheet(isPresented: $showingAddDialog) {
//            addFolderView
//        }
//    }
//
//    // MARK: - Вью для добавления новой папки
//    var addFolderView: some View {
//        NavigationView {
//            VStack {
//                TextField("Название папки", text: $newFolderName)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button("Создать папку") {
//                    if !newFolderName.isEmpty {
//                        // Создаём новую папку
//                        let newFolder = FileFavoriteItem(name: newFolderName, isFolder: true)
//                        items.append(newFolder) // Добавляем в текущий массив
//                        
//                        // Устанавливаем новую папку как активную
//                        activeFolder = newFolder
//                        
//                        // Закрываем диалог
//                        newFolderName = ""
//                        showingAddDialog = false
//                    }
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
//
//                Spacer()
//            }
//            .navigationTitle("Создать папку")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Отмена") {
//                        showingAddDialog = false
//                    }
//                }
//            }
//        }
//    }
//}
//
//// Превью
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteSwiftUIView()
//    }
//}
