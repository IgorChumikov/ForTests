//
//  Image_SymbolRenderingMode.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 symbolRenderingMode (iOS 15+)

 • Управляет тем, как отображается иконка
 • monochrome — один цвет
 • multicolor — системные цвета
 • hierarchical — один цвет с прозрачностью
 • palette — несколько цветов (задаёшь сам)
*/

import SwiftUI

struct Image_SymbolRenderingMode: View {

    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Image",
                subtitle: "Режимы отображения",
                desc: "symbolRenderingMode управляет тем, как рисуются SF Symbols.",
                back: .red,
                textColor: .primary
            )

            // MARK: - Объяснение
            Text("Можно управлять тем, как отображаются системные иконки.")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            // MARK: - monochrome
            Label("Monochrome", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.monochrome)

            // MARK: - multicolor
            Label("Multicolor", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.multicolor)

            // MARK: - hierarchical
            Label("Hierarchical", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.hierarchical)

            // MARK: - palette
            Label("Palette", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.red, .purple.opacity(0.8))

        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Image_SymbolRenderingMode()
}
