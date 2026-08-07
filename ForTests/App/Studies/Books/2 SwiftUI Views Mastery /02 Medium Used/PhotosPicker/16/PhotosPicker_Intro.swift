//
//  PhotosPicker_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 PhotosPicker (iOS 16+)
 
 • Компонент из фреймворка `PhotosUI` для выбора фото и видео из медиатеки.
 • Для использования — импортируйте **PhotosUI**.
 • Можно привязать одно (`PhotosPickerItem`) или несколько (`[PhotosPickerItem]`) значений.
 • Параметр `matching:` ограничивает тип контента (например, `.images`, `.videos`, `.livePhotos` и т.д.).
 
 В примере ниже выбирается **одно фото**, которое затем конвертируется
в `SwiftUI.Image` через асинхронную функцию расширения `convert()`.
 
 */

import SwiftUI
import PhotosUI

struct PhotosPicker_Intro: View {
    @State private var photo: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Кнопка выбора фото
            PhotosPicker(selection: $photo, matching: .images) {
                Text("Select a Photo")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.2)))
            }
            
            Text("Binding to a single PhotosPickerItem limits the user to one photo.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            // MARK: - Отображение выбранного фото
            if let selectedImage {
                VStack {
                    Text("Selected Photo")
                        .font(.headline)
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            
            Spacer()
        }
        .font(.title)
        .padding()
        .onChange(of: photo) { _, newPhoto in
            if let newPhoto {
                Task {
                    selectedImage = await newPhoto.convert()
                }
            }
        }
    }
}

/*
 
 Converting PhotosPickerItem to Image (iOS 16+)
 
 • Метод `loadTransferable(type:)` асинхронно загружает выбранный файл в память.
 • Мы пытаемся получить `Data` и преобразовать его в `UIImage`,
   затем — в `SwiftUI.Image`, чтобы можно было отобразить в интерфейсе.
 • Аннотация `@MainActor` гарантирует, что UI-обновления происходят на главном потоке.
 
 */

import SwiftUI
import PhotosUI

extension PhotosPickerItem {
    /// Загружает и возвращает SwiftUI Image из выбранного PhotosPickerItem
    @MainActor
    func convert() async -> Image {
        do {
            // MARK: - Загрузка бинарных данных из выбранного элемента
            if let data = try await self.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    return Image(uiImage: uiImage)
                }
            }
        } catch {
            print("❌ Error loading image: \(error.localizedDescription)")
        }
        
        // MARK: - Возврат fallback-иконки в случае ошибки
        return Image(systemName: "xmark.octagon")
    }
}

#Preview {
    PhotosPicker_Intro()
}
