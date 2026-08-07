//
//  Rectangular_UnevenCorners.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 UnevenRoundedRectangle (iOS 17)

 • можно задать каждый угол отдельно
 • удобно для кастомных UI
*/

import SwiftUI

struct Rectangular_UnevenCorners: View {

    var body: some View {
        VStack {

            HStack {

                // MARK: - Верхний левый блок
                UnevenRoundedRectangle(
                    topLeadingRadius: .infinity,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 100,
                    topTrailingRadius: 0
                )
                .fill(.blue.gradient)

                // MARK: - Верхний правый блок
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 100,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: .infinity
                )
                .fill(.green.gradient)
            }

            HStack {

                // MARK: - Нижний левый блок
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: .infinity,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 100
                )
                .fill(.blue)

                // MARK: - Нижний правый блок
                UnevenRoundedRectangle(
                    topLeadingRadius: 100,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: .infinity,
                    topTrailingRadius: 0
                )
                .fill(.green)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    Rectangular_UnevenCorners()
}
