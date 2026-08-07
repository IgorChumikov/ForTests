//
//  Table_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 Table — табличное отображение данных (iOS 16+)

 • Позволяет показывать данные в виде таблицы, состоящей из столбцов.
 • Каждый TableColumn отвечает за свою колонку и описывает способ отображения данных.
 • Поддерживает работу с коллекциями Identifiable-типов.
 • Удобно для визуализации структурированных данных: настроек, списков, отчетов.
 */


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
