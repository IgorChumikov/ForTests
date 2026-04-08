//
//  ShareLink_Customize.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 ShareLink — кастомизация внешнего вида (iOS 16+)

 • Можно применять стили кнопок с .buttonStyle() и .tint().
 • Можно использовать кастомный контент (например, фото) для вызова окна "Поделиться".
 • SharePreview позволяет добавить подпись и изображение предпросмотра.
*/

import SwiftUI

struct ShareLink_Customize: View {
    @State private var photo = Image("profile5")

    var body: some View {
        VStack(spacing: 50) {
            // Вариант 1 — как кнопка
            ShareLink(item: "Hello and welcome!")
                .buttonStyle(.borderedProminent)
                .tint(.indigo)

            // Вариант 2 — кастомный контент (фото)
            ShareLink(item: photo,
                      preview: SharePreview("Share Profile Image",
                                            image: photo)) {
                photo
                    .shadow(radius: 8)
            }

            Spacer()
        }
    }
}

#Preview {
    ShareLink_Customize()
}
