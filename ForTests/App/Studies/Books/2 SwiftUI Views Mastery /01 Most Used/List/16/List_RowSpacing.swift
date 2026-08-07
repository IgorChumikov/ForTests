//
//  List_RowSpacing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 listRowSpacing — управление вертикальными интервалами между строками (iOS 16+)

 • Позволяет задать точное расстояние между строками внутри List.
 • Работает поверх системных значений и даёт полный контроль над layout.
 • Можно применять как для всего списка, так и для отдельных секций.
 • Удобно для создания «воздушных» списков, кастомных меню, настроек и карточек.
 • Отлично сочетается с listRowBackground, позволяя выделять отдельные строки.
 */


import SwiftUI

struct List_RowSpacing: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderViewSpacing(
                title: "List",
                subtitle: "Row Spacing",
                desc: "Use the listRowSpacing modifier to adjust the vertical spacing between rows."
            )
            
            // Список с увеличенным расстоянием между строками
            List {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
                Text("Row 4")
                Text("Row 5")
                    .listRowBackground(Color.pink) // фоновый цвет последней строки
            }
            .frame(width: 214) // ограничиваем ширину списка
            .listStyle(.plain)
            .listRowSpacing(100) // 🔹 расстояние между строками в списке
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    List_RowSpacing()
}

// MARK: - Вспомогательный HeaderView
struct HeaderViewSpacing: View {
    let title: String
    let subtitle: String
    let desc: String
    var back: Color = .green
    var textColor: Color = .black
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.largeTitle).bold()
            Text(subtitle)
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(textColor.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(back.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
