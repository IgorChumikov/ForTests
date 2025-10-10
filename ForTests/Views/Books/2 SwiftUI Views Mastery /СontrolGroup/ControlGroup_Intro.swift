//
//  ControlGroup_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

import SwiftUI

struct ControlGroup_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView(
                "ControlGroup",
                subtitle: "Introduction",
                desc: "Use a ControlGroup view to group up related controls."
            )

            // Пример 1: обычная группа
            ControlGroup {
                Button("Hello!") { }
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                }
            }

            // Пример 2: со стилем .navigation
            DescView(desc: "You can change the default style to 'navigation':")
            ControlGroup {
                Button("Hello!") { }
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                }
            }
            .controlGroupStyle(.navigation) // ← стиль навигации
        }
        .font(.title)
    }
}


#Preview {
    ControlGroup_Intro()
}


struct DescView: View {
    var desc: String
    
    var body: some View {
        Text(desc)
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.brown)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
