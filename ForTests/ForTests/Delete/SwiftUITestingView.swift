//
//  SwiftUITestingView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.03.2025.
//

import SwiftUI

struct SwiftUITestingView: View {
    var body: some View {
        // Применение:
        Button("Двойное нажатие") {
            print("Обычное нажатие")
        }
        .buttonStyle(.doubleTap {
            print("Двойное нажатие")
        })
    }
}

#Preview {
    SwiftUITestingView()
}















struct DoubleTapButtonStyle: PrimitiveButtonStyle {
    let doubleTapAction: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture(count: 1, perform: configuration.trigger)
            .onTapGesture(count: 2, perform: doubleTapAction)
    }
}

extension PrimitiveButtonStyle where Self == DoubleTapButtonStyle {
    static func doubleTap(action: @escaping () -> Void) -> DoubleTapButtonStyle {
        DoubleTapButtonStyle(doubleTapAction: action)
    }
}









extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { .init() }
}












struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}
