//
//  Navigation_Searchable_Cancel.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Navigation — searchable с кнопкой Cancel (iOS 15+)
 
 • После выбора результата можно очистить строку поиска и скрыть клавиатуру.
 • Для этого достаточно сбросить значение, привязанное к `searchable(text:)`,
   и вызвать кастомный метод `hideKeyboard()`.
 • Расширение `View.hideKeyboard()` использует UIKit для снятия фокуса с поля ввода.
 
 */

import SwiftUI

struct Navigation_Searchable_Cancel: View {
    private let locations = [
        "Milton", "Milltown", "Millerville", "Milwaukee",
        "Millcreek", "Milagro", "Milano"
    ]
    
    @State private var searchResults: [String] = []
    @State private var locationSearch = ""
    @State private var destination = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Where do you want to go?")
                Text(destination)
                    .fontWeight(.bold)
                
                Spacer()
                
                HeaderView3(
                    title: "",
                    subtitle: "Searchable (Cancel)",
                    desc: "Use searchable to add a text field to the navigation bar and clear it after selecting a result.",
                    back: .blue,
                    textColor: .white
                )
            }
            .font(.title)
            .navigationTitle("Navigation")
        }
        // MARK: - Строка поиска
        .searchable(text: $locationSearch) {
            ForEach(searchResults, id: \.self) { name in
                Button(name) {
                    // 1️⃣ Сохраняем выбранное место
                    destination = name
                    
                    // 2️⃣ Сбрасываем текст поиска
                    locationSearch = ""
                    
                    // 3️⃣ Скрываем клавиатуру
                    hideKeyboard2()
                }
            }
        }
        // MARK: - Фильтрация при изменении текста
        .onChange(of: locationSearch) { _, location in
            searchResults = locations.filter { name in
                name.localizedCaseInsensitiveContains(location)
            }
        }
    }
}

// MARK: - Расширение для скрытия клавиатуры
extension View {
    /// Скрывает клавиатуру, снимая фокус с текущего поля ввода.
    func hideKeyboard2() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    Navigation_Searchable_Cancel()
}
