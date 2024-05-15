//
//  SwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 11.03.2024.
//

import SwiftUI

struct SwiftUIView: View {
    

    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                Button(action: {
                    // Action
                }) {
                    Text("Button Title")
                        .frame(
                            minWidth: (geometry.size.width / 2) - 25,
                            maxWidth: .infinity, minHeight: 44
                        )
                        .font(Font.subheadline.weight(.bold))
                        .background(Color.yellow).opacity(0.8)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)

                }
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding([.leading,.trailing], 5)
            }
        }
        Spacer()
    }
}

#Preview {
    SwiftUIView()
}
