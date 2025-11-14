//
//  TabView_PageTabViewStyle_IndexDisplayMode.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 TabView — скрытие индикаторов страниц (iOS 14+)

 • .indexDisplayMode(.never) — полностью скрывает индикаторы.
 • .indexDisplayMode(.automatic) — показывает точки, только если страниц больше одной.
 • Можно комбинировать с .indexViewStyle(.page(...)) для управления цветом фона.
*/

import SwiftUI

struct TabView_PageTabViewStyle_IndexDisplayMode: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                Text("PAGE 1")
                Spacer()
                Image(systemName: "arrow.down.circle")
                    .padding(.bottom, 45)
            }

            VStack {
                Text("PAGE 2")
            }

            VStack {
                Text("PAGE 3")
            }
        }
        .font(.title)
        .tabViewStyle(.page(indexDisplayMode: .never)) // скрываем точки
    }
}

#Preview {
    TabView_PageTabViewStyle_IndexDisplayMode()
}
