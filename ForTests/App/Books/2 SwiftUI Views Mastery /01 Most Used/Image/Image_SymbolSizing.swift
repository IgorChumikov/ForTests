//
//  Image_SymbolSizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Размер SF Symbols (iOS 14+)

 • .imageScale() — быстрый способ (small / medium / large)
 • .font() — лучший способ (адаптивный размер)
 • .font(.system(size:)) — фиксированный размер (не адаптивный)
*/

import SwiftUI

struct Image_SymbolSizing: View {

    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Image",
                subtitle: "Размер иконок",
                desc: "Изменяй размер системных иконок разными способами.",
                back: .red,
                textColor: .primary
            )

            // MARK: - imageScale
            Text("Можно менять размер через imageScale")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun")
                    .imageScale(.large)

                Image(systemName: "thermometer.sun")
                    .imageScale(.medium)

                Image(systemName: "thermometer.sun")
                    .imageScale(.small)
            }

            // MARK: - font styles
            Text("Также можно менять размер через font (рекомендуется)")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun")
                    .font(.largeTitle)

                Image(systemName: "thermometer.sun")
                    .font(.title)

                Image(systemName: "thermometer.sun")
                    .font(.body)

                Image(systemName: "thermometer.sun")
                    .font(.caption)
            }

            // MARK: - fixed size
            Text("Можно задать фиксированный размер (не адаптивный)")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun")
                    .font(.system(size: 60))

                Image(systemName: "thermometer.sun")
                    .font(.system(size: 50))

                Image(systemName: "thermometer.sun")
                    .font(.system(size: 40))

                Image(systemName: "thermometer.sun")
                    .font(.system(size: 30))
            }

        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_SymbolSizing()
}
