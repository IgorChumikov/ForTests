//
//  ViewThatFits_Vertical.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
Проверка идёт по высоте.
В портретной ориентации места много по высоте → берётся первый вариант.
В ландшафте высота ограничена → выбирается второй, более компактный вариант.
 */

import SwiftUI

struct ViewThatFits_Vertical: View {
    var body: some View {
        ViewThatFits(in: .vertical) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.purple.opacity(0.7))
                .overlay(Text("For Portrait"))
                .frame(width: 200, height: 500)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.7))
                .overlay(Text("For Landscape"))
                .frame(width: 400, height: 100)

            Text("No views fit")
        }
    }
}

#Preview {
    ViewThatFits_Vertical()
}
