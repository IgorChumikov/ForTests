//
//  PanelViewNew.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

import SwiftUI

private extension CGFloat {
    static let radius: CGFloat = 20
    static let indicatorPadding: CGFloat = 8
    static let snapRatio: CGFloat = 0.33
}

// MARK: - PanelViewNew

public struct PanelViewNew: View {
    // MARK: - Properties

    @Environment(\.isSheetPresented)
    private var isSheetPresented: Binding<Bool>
    @Environment(\.bottomSheetAnimationDuration)
    private var animationDuration: Double
    @Environment(\.safeAreaInsets)
    private var safeAreaInsets: EdgeInsets
    @Environment(\.bottomSheetMaxHeight)
    private var maxHeight: CGFloat
    @GestureState
    private var translation: CGFloat = 0
    @State
    private var bottomViewHeight: CGFloat = 0
    @State
    private var indicatorHeight: CGFloat = 0

    // MARK: - Computed Properties

    private var offset: CGFloat {
        if isSheetPresented.wrappedValue {
            return max(translation, .zero)
        } else {
            return bottomViewHeight + safeAreaInsets.bottom
        }
    }

    // MARK: - Content

    public var body: some View {
        VStack(spacing: .zero) {
            Spacer(minLength: .zero)

            VStack(spacing: .zero) {
                VStack {
                    Text("Это содержимое нижнего листа")
                    Text("Это содержимое нижнего листа")
                    Text("Это содержимое нижнего листа")
                    Text("Это содержимое нижнего листа")
                    Text("Это содержимое нижнего листа")
                    Text("Это содержимое нижнего листа")
                }
                    .environment(\.bottomSheetMaxHeight, maxHeight - indicatorHeight)
            }
            .frame(maxWidth: .infinity)
            .background {
                Color.blue
                    .cornerRadius(.radius, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(edges: .bottom)
            }
            .contentSize(.dynamic) { size in
                bottomViewHeight = size.height
            }
           .offset(y: offset)
            .animation(.interactiveSpring(response: animationDuration), value: translation == 0)
            .animation(.spring(response: animationDuration), value: isSheetPresented.wrappedValue)
            .gesture(makeGesture())
        }
    }

    // MARK: - Functions

    private func makeGesture() -> some Gesture {
        DragGesture()
            .updating($translation) { value, state, _ in
                state = value.translation.height
            }
            .onEnded { value in
                let transition = value.translation.height
                guard transition > 0 else { return }

                isSheetPresented.wrappedValue = transition < bottomViewHeight * .snapRatio
            }
    }
}

// MARK: - PanelViewNew_Previews

struct PanelViewNew_Previews: PreviewProvider {
    static var previews: some View {
        PanelViewNew()
    }
}


public extension EnvironmentValues {
    /// Bottom sheet animation
    var isSheetPresented: Binding<Bool> {
        get { self[PresentedBottomSheetKey.self] }
        set { self[PresentedBottomSheetKey.self] = newValue }
    }
    
    /// Bottom sheet animation
    var bottomSheetAnimationDuration: Double {
        get { self[AnimationBottomSheetKey.self] }
        set { self[AnimationBottomSheetKey.self] = newValue }
    }
}

private struct PresentedBottomSheetKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

// MARK: - AnimationBottomSheetKey

private struct AnimationBottomSheetKey: EnvironmentKey {
    static let defaultValue: Double = 0.3
}


public extension EnvironmentValues {
    /// Отступы, которые используется для определения безопасной области для этого представления.
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.firstWindow?.safeAreaInsets.swiftUiInsets ?? EdgeInsets()
    }
}

public extension UIApplication {
    @inlinable var firstWindow: UIWindow? {
        connectedScenes.lazy
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first(where: \.isKeyWindow)
    }
}

private extension UIEdgeInsets {
    var swiftUiInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}

public extension View {
    /// Corner radius for a view
    @inlinable
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - RoundedCorner

@usableFromInline
struct RoundedCorner: Shape {
    // MARK: - Properties

    var radius: CGFloat
    var corners: UIRectCorner

    // MARK: - Init

    @usableFromInline
    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    // MARK: - Functions

    @usableFromInline
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
