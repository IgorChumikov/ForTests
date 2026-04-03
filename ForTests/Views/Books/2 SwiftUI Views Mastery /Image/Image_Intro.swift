//
//  Image_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Image — базовое использование

 • По умолчанию изображение сохраняет свой размер.
 • .resizable() позволяет изменить размер.
 • После .resizable() нужно использовать frame.
*/

import SwiftUI

struct Image_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "Image",
                subtitle: "Из ассетов",
                desc: "По умолчанию изображение сохраняет свой размер.",
                back: .red,
                textColor: .white
            )
            
            // MARK: - Без resizable
            Image("Fire")
            
            Text("Можно изменить через resizable")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
            
            // MARK: - С resizable
            Image("Fire")
                .resizable()
                .frame(height: 200)
            
            Text("resizable растягивает изображение")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_Intro()
}
