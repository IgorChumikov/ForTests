////
////  SwiftUIViewIpad4.swift
////  ForTests
////
////  Created by Игорь Чумиков on 03.10.2024.
////
//
//import SwiftUI
//
//struct SwiftUIViewIpad4: View {
//    
//    var body: some View {
//        NavigationView {
//            List {
//                Section {
//                    NavigationLink(destination: Text("Мой экран 1")) {
//                        HStack(alignment: .center, spacing: 10) {
//                            Image(systemName: "bookmark")
//                                .foregroundColor(.blue)
//                            Text("Закладки и документы")
//                        }
//                    }
//                    
//                    NavigationLink(destination: Text("Мой экран 2")) {
//                        HStack(alignment: .center, spacing: 10) {
//                            Image(systemName: "folder")
//                                .foregroundColor(.orange)
//                            Text("Папки")
//                        }
//                    }
//                    
//                    NavigationLink(destination: Text("Мой экран 3")) {
//                        HStack(alignment: .center, spacing: 10) {
//                            Image(systemName: "doc.text")
//                                .foregroundColor(.green)
//                            Text("Документы на контроле")
//                        }
//                    }
//                }
//                
//                Section {
//                    NavigationLink(destination: Text("Мой экран 4")) {
//                        HStack {
//                            Image(systemName: "tray.and.arrow.down")
//                                .foregroundColor(.purple)
//                            Text("Загруженные документы")
//                        }
//                    }
//                }
//            }
//            .listStyle(SidebarListStyle()) // Стиль бокового меню
//            .scrollDisabled(true) // Отключение прокрутки
//        }
//    }
//}
//
//
//#Preview {
//    SwiftUIViewIpad4()
//}
