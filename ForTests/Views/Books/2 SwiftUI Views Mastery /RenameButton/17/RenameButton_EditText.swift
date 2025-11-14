//
//  RenameButton_EditText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 RenameButton — редактирование текста (iOS 17+)
 
 • Позволяет добавить системную кнопку «Переименовать» (RenameButton),
   которая автоматически вызывает действие, заданное в `.renameAction { }`.
 • Удобно для редактирования имён, заголовков, меток и т.д.
 • Можно сочетать с `@FocusState`, чтобы сразу фокусировать `TextField`.
 
 */

import SwiftUI

struct RenameButton_EditText: View {
    @State private var editText = false
    @State private var name = "Mark"
    @FocusState private var nameFocused: Bool
    
    var body: some View {
        VStack {
            if editText {
                // MARK: - Режим редактирования
                HStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .focused($nameFocused)
                    
                    Button("Done") {
                        editText.toggle()
                    }
                }
            } else {
                // MARK: - Режим отображения
                HStack {
                    Text(name)
                    Spacer()
                    RenameButton()
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .renameAction {
            // Вызывается при нажатии RenameButton
            editText.toggle()
            nameFocused.toggle()
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    RenameButton_EditText()
}
