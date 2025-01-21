//
//  SwiftUIViewIpad4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.10.2024.
//

import SwiftUI

struct SwiftUIViewIpad4: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Мой экран 1")) {
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "bookmark") // Иконка перед текстом
                                .foregroundColor(.blue) // Цвет иконки
                            Text("Закладки и документы") // Текст строки
                        }
                    }
                    
                    NavigationLink(destination: Text("Мой экран 2")) {
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "folder") // Иконка перед текстом
                                .foregroundColor(.orange)
                            Text("Папки")
                        }
                    }
                    
                    NavigationLink(destination: Text("Мой экран 3")) {
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "doc.text") // Иконка перед текстом
                                .foregroundColor(.green)
                            Text("Документы на контроле")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Мой экран 4")) {
                        HStack {
                            Image(systemName: "tray.and.arrow.down") // Иконка перед текстом
                                .foregroundColor(.purple)
                            Text("Загруженные документы")
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle()) // Стиль бокового меню
            .scrollDisabled(true) // Отключение прокрутки
        }
    }
}


#Preview {
    SwiftUIViewIpad4()
}
