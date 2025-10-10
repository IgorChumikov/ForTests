//
//  LazyHGrid_RowAndColumnSpacing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

import SwiftUI

struct LazyHGrid_RowAndColumnSpacing: View {
    @State private var columnSpacing: CGFloat = 10
    @State private var rowSpacing: CGFloat = 20
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "LazyHGrid",
                subtitle: "Spacing Example",
                desc: "This is just to give you an idea of controlling column and row spacing."
            )
            
            let rows = [
                GridItem(.fixed(40), spacing: rowSpacing),
                GridItem(.fixed(40), spacing: rowSpacing),
                GridItem(.fixed(40))
            ]
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: columnSpacing) {
                    ForEach(1 ..< 11) { _ in
                        Color.green
                            .frame(width: 40, height: 40)
                    }
                }
                .padding()
            }
            
            VStack {
                // Колонки
                Slider(
                    value: $columnSpacing,
                    in: 0...40,
                    step: 5,
                    minimumValueLabel: Text("0"),
                    maximumValueLabel: Text("40"),
                    label: { Text("Minimum Spacing") }
                )
                Text("Column Spacing: \(Int(columnSpacing))")
                    .padding(.bottom)
                
                // Ряды
                Slider(
                    value: $rowSpacing,
                    in: 0...40,
                    step: 5,
                    minimumValueLabel: Text("0"),
                    maximumValueLabel: Text("40"),
                    label: { Text("Minimum Spacing") }
                )
                Text("Row Spacing: \(Int(rowSpacing))")
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

// Пример HeaderView для теста
struct HeaderView: View {
    var title: String
    var subtitle: String
    var desc: String
    
    init(_ title: String, subtitle: String, desc: String) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
    }
    
    var body: some View {
        VStack {
            Text(title).font(.largeTitle).bold()
            Text(subtitle).font(.title2)
            Text(desc).font(.body).multilineTextAlignment(.center)
        }
        .padding()
    }
}


#Preview {
    LazyHGrid_RowAndColumnSpacing()
}
