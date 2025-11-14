//
//  ShareLink_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 ShareLink — системное окно "Поделиться" (iOS 16+)

 • Позволяет делиться текстом, URL, массивами и изображениями.
 • Основной параметр — item: это то, что будет отправлено.
 • Поддерживает subject и message для email.
 • Можно добавить визуальный предпросмотр через SharePreview.
*/

import SwiftUI

struct ShareLink_Intro: View {
    var body: some View {
        Form {
            // Текст
            Section("Text") {
                ShareLink(item: "Hello and welcome!")
                ShareLink("Share Text", item: "Hello and welcome!")
                ShareLink(item: "Hello and welcome!") {
                    Label("Share Text", systemImage: "square.and.arrow.up.circle")
                }

                // Пример с темой и сообщением
                ShareLink("Share Text",
                          item: "Hello and welcome!",
                          subject: Text("Subject"),
                          message: Text("This is the message"),
                          preview: SharePreview(
                            Text("Share Preview"),
                            image: Image(systemName: "doc.richtext"),
                            icon: Image(systemName: "doc.richtext")
                          )
                )
            }

            // URL
            Section("URL") {
                ShareLink("Share URL", item: URL(string: "bigmountainstudio.com")!)
            }

            // Коллекции
            Section("Collections") {
                ShareLink("Share Collections", items: ["Milk", "Eggs", "Bread"])
            }

            // Фото
            Section("Photo") {
                ShareLink(item: Image(systemName: "globe.americas.fill"),
                          preview: SharePreview("The Globe",
                          image: Image(systemName: "globe.americas.fill"))) {
                    Label("Share Photo", systemImage: "globe.americas.fill")
                }
            }
        }
        .headerProminence(.increased)
        .font(.title)
    }
}

#Preview {
    ShareLink_Intro()
}
