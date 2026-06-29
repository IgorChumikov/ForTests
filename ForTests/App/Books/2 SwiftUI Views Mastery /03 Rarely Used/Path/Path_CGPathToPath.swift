//
//  Path_CGPathToPath.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

import SwiftUI

struct Path_CGPathToPath: View {

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Верхний блок
            RoundedCorners(
                cornerRadius: 20,
                corners: [.topRight, .bottomRight]
            )
            .fill(.purple)
            .frame(height: 80)
            .padding(.trailing, 50)
            .padding(.top, 50)

            // MARK: - Второй блок
            RoundedCorners(
                cornerRadius: 40,
                corners: [.topRight, .bottomLeft]
            )
            .fill(.purple)
            .padding(.horizontal, 100)
            .padding(.top, 50)

            Spacer()

            // MARK: - Нижний блок
            HStack {
                Image(systemName: "info.circle")
                Text("More info")
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: 75)
            .foregroundStyle(.white)
            .background(
                RoundedCorners(
                    cornerRadius: 30,
                    corners: [.topLeft]
                )
                .fill(.purple)
            )
            .padding(.leading, 50)
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Path_CGPathToPath()
}

/*
 UIKit + SwiftUI

 • UIBezierPath умеет скруглять конкретные углы
 • SwiftUI Path принимает CGPath
 • используем вместе
*/

import SwiftUI

struct RoundedCorners: Shape {

    var cornerRadius: CGFloat = 20

    // 👉 какие углы скруглять
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {

        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: cornerRadius,
                height: cornerRadius
            )
        )

        return Path(path.cgPath) // 🔥 конвертация
    }
}
