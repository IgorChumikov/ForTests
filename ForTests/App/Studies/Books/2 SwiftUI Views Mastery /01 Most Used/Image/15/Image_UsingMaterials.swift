//
//  Image_UsingMaterials.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Materials в SF Symbols (iOS 15+)

 • Materials — это тоже ShapeStyle
 • Их можно применять к иконкам через foregroundStyle
 • Дают эффект стекла / размытия (blur)
 • Есть разные уровни: ultraThin, thin, regular, thick
 */

import SwiftUI

struct Image_UsingMaterials: View {
    var body: some View {
        ZStack {

            Image("look")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 20) {

                HeaderView3(
                    title: "Image - Symbols",
                    subtitle: "Using Materials",
                    desc: "Materials — это тоже ShapeStyle, значит их можно применять к иконкам.",
                    back: .red,
                    textColor: .black
                )
                .background(.bar)

                HStack {
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.secondary)

                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.tertiary)

                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.quaternary)
                }
                .font(.system(size: 90))
                .padding()
                .background(
                    .regularMaterial,
                    in: RoundedRectangle(cornerRadius: 20)
                )

                HStack {
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.ultraThinMaterial)

                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.regularMaterial)

                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.thickMaterial)
                }
                .font(.system(size: 90))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.thinMaterial, lineWidth: 8)
                )
            }
            .font(.title)
        }
    }
}

#Preview {
    Image_UsingMaterials()
}
