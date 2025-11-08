//
//  ShareLink_SharePreview.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SharePreview — добавление собственного предпросмотра для ShareLink (iOS 16+)

 • Используется внутри ShareLink.
 • Позволяет задать заголовок, изображение и иконку предпросмотра.
 • Без SharePreview система создаёт стандартный вид автоматически.
*/

import SwiftUI

struct ShareLink_SharePreview: View {
    var body: some View {
        Form {
            Section("Text") {
                // Стандартное поведение (автоматическое превью)
                ShareLink(item: "Hello and welcome!")

                // Кастомное превью с темой, сообщением и иконкой
                ShareLink(
                    "Share Text",
                    item: "Hello and welcome!",
                    subject: Text("Subject"),
                    message: Text("This is the message"),
                    preview: SharePreview(
                        Text("Share Preview"),
                        image: Image("profile2"),
                        icon: Image(systemName: "figure.walk")
                    )
                )
            }
        }
        .headerProminence(.increased)
        .font(.title)
    }
}

#Preview {
    ShareLink_SharePreview()
}
