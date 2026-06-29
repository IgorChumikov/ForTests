//
//  TabView_Customizations.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 TabView — кастомизация контента (iOS 14+)

 • Можно использовать как горизонтальную карусель карточек.
 • "Прилипает" к одной карточке за раз, в отличие от ScrollView.
 • Отлично подходит для галерей, отзывов или профилей.
*/

import SwiftUI

struct TabView_Customizations: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("People")
                .font(.title2)
                .bold()

            TabView {
                ForEach(1..<12) { index in
                    VStack(spacing: 20) {
                        Text("Person \(index)")
                            .font(.headline)
                        Image("profile\(index)")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.yellow.opacity(0.7))
                    )
                    .padding()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .font(.title)
    }
}

#Preview {
    TabView_Customizations()
}
