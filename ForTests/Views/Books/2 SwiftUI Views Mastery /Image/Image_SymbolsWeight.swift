//
//  Image_SymbolsWeight.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Толщина SF Symbols (iOS 14+)

 • Иконки имеют weight (толщину) как текст
 • Меняется через .font(... .weight(...))
 • Можно комбинировать с размером
*/

import SwiftUI

struct Image_SymbolsWeight: View {

    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Image",
                subtitle: "Толщина иконок",
                desc: "Иконки имеют толщину как текст — её можно менять.",
                back: .red,
                textColor: .primary
            )

            // MARK: - Объяснение
            Text("Как и у текста, у иконок есть толщина (weight). Меняется так же, как у шрифта.")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            // MARK: - Примеры weight
            HStack(spacing: 40) {
                Image(systemName: "moon.stars")
                    .font(.largeTitle.weight(.ultraLight))

                Image(systemName: "moon.stars")
                    .font(.largeTitle.weight(.regular))

                Image(systemName: "moon.stars")
                    .font(.largeTitle.weight(.semibold))

                Image(systemName: "moon.stars")
                    .font(.largeTitle.weight(.bold))

                Image(systemName: "moon.stars")
                    .font(.largeTitle.weight(.black))
            }

            // MARK: - Кастомный размер + weight
            Text("Можно задать свой размер и толщину")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            HStack(spacing: 40) {
                Image(systemName: "moon.zzz")
                    .font(.system(size: 60, weight: .ultraLight))

                Image(systemName: "moon.zzz")
                    .font(.system(size: 60, weight: .light))

                Image(systemName: "moon.zzz")
                    .font(.system(size: 60, weight: .regular))

                Image(systemName: "moon.zzz")
                    .font(.system(size: 60, weight: .bold))
            }

        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_SymbolsWeight()
}
