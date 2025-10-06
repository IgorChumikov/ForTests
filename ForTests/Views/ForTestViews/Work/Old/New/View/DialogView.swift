//
//  DialogView.swift
//
//

import SwiftUI

private extension CGFloat {
    static let contentPadding: CGFloat = 24
    static let radius: CGFloat = 16
    static let padding: CGFloat = 32
}

// MARK: - DialogView

public struct DialogView: View {
    // MARK: - Properties

    var isSheetPresented: Bool = true
    @Environment(\.bottomSheetAnimationDuration)
    private var animationDuration: Double

    @Environment(\.bottomSheetMaxHeight)
    private var maxHeight: CGFloat

    @State
    private var bottomViewHeight: CGFloat = 0


    // MARK: - Content

    public var body: some View {
        ZStack(alignment: .center) {
            VStack(spacing: .zero) {
                Spacer(minLength: .zero)
                VStack {
                    Text("Коммерческая версия с доступом к вашему комплекту")
                    Text("Коммерческая версия с доступом к вашему комплекту")
                    Text("Коммерческая версия с доступом к вашему комплекту")
                }
                    .frame(maxWidth: .infinity)
                    .padding(.contentPadding)
                    .background(Color.blue)
                    .cornerRadius(.radius)
                    .environment(\.bottomSheetMaxHeight, maxHeight - 2 * .contentPadding - 2 * .padding)
                    .transition(.opacity.animation(.linear(duration: animationDuration)))

                Spacer(minLength: .zero)
            }
        }
        .padding(.padding)
    }
}

// MARK: - DialogView_Previews

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        PanelViewNew()
    }
}
