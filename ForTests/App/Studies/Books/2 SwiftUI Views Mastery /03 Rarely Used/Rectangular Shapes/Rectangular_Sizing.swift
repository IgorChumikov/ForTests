//
//  Rectangular_Sizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

import SwiftUI

struct Rectangular_Sizing: View {

    var body: some View {
        VStack(spacing: 10) {

            Text("Rectangular Shapes")
                .font(.largeTitle)

            Text("Sizing")
                .foregroundStyle(.gray)

            Text("Use modifiers like padding or frame to size shapes.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)

            // MARK: - Padding
            Text("Using padding")

            ZStack {
                Rectangle().padding()
                Rectangle().padding(40).colorInvert()
                Rectangle().padding(60)
                Rectangle().padding(80).colorInvert()
            }
            .frame(width: 200, height: 200)

            // MARK: - Frame
            Text("Using frames")

            ZStack(alignment: .bottomLeading) {

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 320, height: 250)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 270, height: 200)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 220, height: 150)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 170, height: 100)
            }
        }
        .font(.title)
        .background(Color.secondary)
    }
}

#Preview {
    Rectangular_Sizing()
}
