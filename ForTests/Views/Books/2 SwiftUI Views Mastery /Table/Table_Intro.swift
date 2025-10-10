//
//  Table_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

// Здесь демонстрируется новый контейнер Table (SwiftUI 4, iOS 16 / macOS 13).
// Он позволяет выводить данные в табличном виде: каждая колонка соответствует какому-то свойству модели.
// Похож на List, но поддерживает несколько колонок (как в таблицах macOS).

import SwiftUI

struct ColorInfo: Identifiable {
    let id = UUID()
    var name = ""
    var desc = Color.clear
}

struct Table_Intro: View {
    @State private var colors = [
        ColorInfo(name: "Red", desc: Color.red),
        ColorInfo(name: "Blue", desc: Color.blue),
        ColorInfo(name: "Purple", desc: Color.purple)
    ]

    var body: some View {
        Table(colors) {
            TableColumn("Names") { color in
                Text(color.name)
            }
            TableColumn("Colors") { color in
                color.desc
            }
        }
        .font(.title)
    }
}

#Preview {
    Table_Intro()
}
