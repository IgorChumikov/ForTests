//
//  Rectangular_StrokeBorder.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Stroke vs StrokeBorder

 • stroke — рисует от центра линии
 • strokeBorder — рисует внутрь
*/

import SwiftUI

struct Rectangular_StrokeBorder: View {

    var body: some View {
        VStack(spacing: 20) {

            Text("Rectangular Shapes")
                .font(.largeTitle)
                .foregroundStyle(.white)

            // MARK: - stroke (вылезает наружу)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.orange, lineWidth: 40)
                    .frame(width: 300, height: 300)

                RoundedRectangle(cornerRadius: 40)
                    .stroke() // просто контур
                    .frame(width: 300, height: 300)
            }

            Text("stroke выходит наружу")
                .foregroundStyle(.white)

            // MARK: - strokeBorder (внутрь)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .strokeBorder(Color.orange, lineWidth: 40)
                    .frame(width: 300, height: 300)

                RoundedRectangle(cornerRadius: 40)
                    .stroke()
                    .frame(width: 300, height: 300)
            }

            Text("strokeBorder рисует внутрь")
                .foregroundStyle(.white)
        }
        .font(.title)
        .background(Color.black)
    }
}

#Preview {
    Rectangular_StrokeBorder()
}
