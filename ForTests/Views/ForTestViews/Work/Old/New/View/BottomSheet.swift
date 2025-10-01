//
//  BottomSheet.swift
//

import SwiftUI

private extension UIColor {
    static let bgColor: UIColor = UIColor.red
}

private extension Double {
    static let bgOpacity: Double = 0.3
}

// MARK: - BottomSheet

struct BottomSheet<Content: View>: View {
    // MARK: - Properties

    /// Значение которое передается при иниализации и потом дальше по вьюхам,
    /// чтобы можно было закрывать и открывать  BottomSheet с анимацией одним параметром
    @Binding
    var isPresented: Bool
    @ViewBuilder
    var content: () -> Content
    var onDismiss: TapHandler?

    @State
    private var isSheetPresented: Bool = false
    @State
    private var isWindowPresented: Bool = false

    @Environment(\.bottomSheetAnimationDuration)
    private var animationDuration: Double

    // MARK: - Init

    init(
        isPresented: Binding<Bool>,
        onDismiss: TapHandler? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        _isPresented = isPresented
        self.content = content
        self.onDismiss = onDismiss
    }

    // MARK: - Content

    var body: some View {
        EmptyView()
            .transparentFullScreenCover(isPresented: $isWindowPresented, onDismiss: onDismiss) {
                GeometryReader { geo in
                    ZStack {
                        Background()
                            .hidden(!isSheetPresented, mode: .removed)
                            .onTapGesture {
                                isPresented = false
                            }
                            .onDisappear {
                                isWindowPresented = false
                            }
                        content()
                            .opacity(isPresented ? 1 : 0)
                            .environment(\.isSheetPresented, $isSheetPresented)
                            .environment(\.bottomSheetMaxHeight, geo.size.height)
                    }
                }
                .onAppear {
                    isSheetPresented = true
                }
            }
           // .transaction {
               // $0 = .disabled
          //  }
            .onChange(of: isPresented) { newValue in
                if newValue {
                    isWindowPresented = newValue
                } else {
                    isSheetPresented = newValue
                }
            }
    }
}

// MARK: - BottomSheet.Background

extension BottomSheet {
    struct Background: View {
        // MARK: - Properties

        @Environment(\.bottomSheetAnimationDuration)
        private var animationDuration: Double

        // MARK: - Content

        var body: some View {
            Color(.bgColor)
                .opacity(.bgOpacity)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.opacity.animation(.linear(duration: animationDuration)))
                .edgesIgnoringSafeArea(.all)
                .contentShape(Rectangle())
        }
    }
}

// MARK: - BottomSheet_Previews

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(isPresented: .constant(true)) {
            ScrollView {
                Text("123")
                    .padding()
                Text("Отмена")
                    .padding()
            }
            .fixedSize()
        }
    }
}


public typealias TapHandler = () -> Void


public extension View {
    /// Показ модальной вью, покрывающей весь экран
    /// - Parameters:
    ///   - isPresented: Связка Bool значения, означающего показ или скрытие вью
    ///   - content: Замыкание, возвращающее контент модальной вью
    @inlinable
    func transparentFullScreenCover<Content: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        content: @escaping () -> Content
    ) -> some View {
        fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            ZStack {
                content()
            }
            .background(Color.black)
        }
    }
}

