//
//  ContentView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 27.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Введите текст")) {
                    TextEditor(text: $text)
                       .frame(height: 200) // Установите высоту в соответствии с вашими требованиями
                }
            }
           .navigationTitle("Многострочный ввод")
        }
    }
}


#Preview {
    ContentView()
}
