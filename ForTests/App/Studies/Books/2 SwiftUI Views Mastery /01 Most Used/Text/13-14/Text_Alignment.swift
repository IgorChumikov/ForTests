//
//  Text_Alignment.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — выравнивание многострочного текста (iOS 13+)

 • По умолчанию: leading.
 • Используйте .multilineTextAlignment(.center / .trailing), чтобы изменить выравнивание.
*/

import SwiftUI

struct Text_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Multiline Text Alignment")
                .font(.title)
                .foregroundStyle(.gray)
            Image(systemName: "text.alignleft")

            // Без модификатора (leading)
            Text("""
            By default, text will be centered within the screen. But when it wraps to multiple lines, it will be leading aligned by default. Use multilineTextAlignment modifier to change this!
            """)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(Color.green)

            // Center alignment
            Text(".multilineTextAlignment(.center)")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(Color.green)

            Text("Have I told you how awesome I think you are?")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Trailing alignment
            Text(".multilineTextAlignment(.trailing)")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(Color.green)

            Text("You are SUPER awesome for improving your skills by using this book!")
                .multilineTextAlignment(.trailing)
                .padding(.horizontal)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Text_Alignment()
}
