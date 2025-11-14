//
//  TextField_Autocapitalization.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — автозаглавные буквы (iOS 15+)

 • По умолчанию TextField делает первую букву каждого предложения заглавной.
 • Модификатор .textInputAutocapitalization(_:) позволяет изменить это поведение.
 • Используй .words, .sentences, .never или .characters в зависимости от задачи.
 • Полезно для полей: имени, e-mail, адреса сайта, кода страны и т.п.
*/

import SwiftUI

struct TextField_Autocapitalization: View {
    // MARK: - Properties
    @State private var textFieldData1 = "" // Имя
    @State private var textFieldData2 = "" // Био
    @State private var textFieldData3 = "" // Сайт
    @State private var textFieldData4 = "" // Код страны

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            Text("Words")
                .font(.title)

            // Автозаглавная каждая отдельная "Слово"
            TextField("First & Last Name", text: $textFieldData1)
                .textInputAutocapitalization(.words)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // Автозаглавная только первая буква в предложении (поведение по умолчанию)
            Text("Sentences (default)")
            TextField("Bio", text: $textFieldData2)
                .textInputAutocapitalization(.sentences)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // Без автозаглавных букв
            Text("Never")
            TextField("Web Address", text: $textFieldData3)
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // Автозаглавные все символы
            Text("Characters")
            TextField("Country Code", text: $textFieldData4)
                .textInputAutocapitalization(.characters)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TextField_Autocapitalization()
}
