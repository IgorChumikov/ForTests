//
//  Text_BaselineOffset.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — смещение базовой линии (iOS 13+)

 • .baselineOffset(_:) смещает текст относительно базовой линии.
 • Положительные значения поднимают текст вверх, отрицательные — вниз.
*/

import SwiftUI

struct Text_BaselineOffset: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Baseline Offset")
                .font(.title)
                .foregroundStyle(.gray)
            Image(systemName: "textformat.superscript")

            // Текст без смещения
            Group {
                Text("100").bold()
                + Text(" SWIFTUI ").font(.largeTitle).fontWeight(.light).foregroundStyle(.blue)
                + Text("VIEWS")
            }

            // Текст со смещением
            Group {
                Text("100").bold()
                + Text(" SWIFTUI ")
                    .font(.system(size: 60))
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.blue)
                    .baselineOffset(-12) // Опускаем текст
                + Text("VIEWS").bold()
            }
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    Text_BaselineOffset()
}
