//
//  ColorPicker_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import SwiftUI

// MARK: - HeaderView
struct HeaderView_Intro: View {
    let title: String
    let subtitle: String
    let desc: String
    let back: Color     // 👈 параметр называется back

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.largeTitle)
                .bold()
            Text(subtitle)
                .font(.title2)
                .foregroundStyle(.secondary)
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(back.opacity(0.2))
        .cornerRadius(12)
    }
}

// MARK: - Основная View
struct ColorPicker_Intro: View {
    @State private var color = Color.pink

    var body: some View {
        VStack(spacing: 20) {
            HeaderView_Intro(
                title: "ColorPicker",
                subtitle: "Introduction",
                desc: """
                Use the ColorPicker to provide your users with color options. 
                You will need to bind it to a color variable to store the color selected.
                """,
                back: color   // 👈 совпадает с параметром back
            )

            Spacer()

            ColorPicker("Pick a Color", selection: $color)
                .padding(.horizontal)
                .font(.title2)

            Text("When a color is selected it will change the back color of this text.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .font(.title3)
        .animation(.easeInOut, value: color)
    }
}

// MARK: - Preview
#Preview {
    ColorPicker_Intro()
}
