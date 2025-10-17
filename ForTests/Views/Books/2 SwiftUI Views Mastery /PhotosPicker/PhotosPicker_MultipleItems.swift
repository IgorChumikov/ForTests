//
//  PhotosPicker_MultipleItems.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 PhotosPicker с множественным выбором (iOS 16+)
 
 • Чтобы разрешить выбор нескольких изображений,
   используйте `@State var photos: [PhotosPickerItem] = []`.
 • Привязка массива `PhotosPickerItem` позволяет пользователю выбрать сразу несколько фото.
 • После изменения массива `photos` можно асинхронно конвертировать
   все выбранные элементы в SwiftUI Image (см. функцию `convert()` ниже).
 
 */

import SwiftUI
import PhotosUI

struct PhotosPicker_MultipleItems: View {
    @State private var photos: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - PhotosPicker с множественным выбором
            PhotosPicker(
                selection: $photos,
                matching: .images
            ) {
                Text("Select Photos")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.2)))
            }
            
            if !selectedImages.isEmpty {
                Text("Selected Photos")
                    .font(.headline)
                
                List {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        selectedImages[index]
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.vertical, 4)
                    }
                }
            } else {
                Text("No photos selected")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .font(.title)
        .padding()
        // MARK: - Реакция на изменение массива photos
        .onChange(of: photos) { _, newPhotos in
            Task {
                selectedImages.removeAll()
                for newPhoto in newPhotos {
                    let image = await newPhoto.convert()
                    selectedImages.append(image)
                }
            }
        }
    }
}

#Preview {
    PhotosPicker_MultipleItems()
}
