//
//  RoundedRectangle_CornerSize.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 CornerSize

 • cornerSize задаёт форму скругления
 • width — горизонталь
 • height — вертикаль
*/

import SwiftUI

struct RoundedRectangle_CornerSize: View {

    var body: some View {
        VStack(spacing: 20) {

            HeaderView3(
                title: "RoundedRectangle",
                subtitle: "CornerSize",
                desc: "Customize width & height of corners",
                back: .blue,
                textColor: .white
            )

            // MARK: - Вытянутый по вертикали
            Text("Corner width: 40, height: 60")
                .foregroundStyle(.white)

            RoundedRectangle(
                cornerSize: CGSize(width: 40, height: 60)
            )
            .fill(.blue)
            .frame(height: 120)
            .padding()

            // MARK: - Вытянутый по горизонтали
            Text("Corner width: 60, height: 40")
                .foregroundStyle(.white)

            RoundedRectangle(
                cornerSize: CGSize(width: 60, height: 40)
            )
            .fill(.blue)
            .frame(height: 120)
            .padding()
        }
        .font(.title)
        .background(Color.black)
    }
}

#Preview {
    RoundedRectangle_CornerSize()
}
