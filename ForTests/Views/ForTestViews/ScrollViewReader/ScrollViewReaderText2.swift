import SwiftUI

struct ScrollViewReaderText2: View {
    @State private var previousOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var shouldRestoreScroll = false

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        GeometryReader { geo in
                            Color.clear
                                .preference(key: ViewOffsetKey2.self, value: geo.frame(in: .named("scroll")).minY)
                        }
                        .frame(height: 0)

                        ForEach(0..<100, id: \.self) { i in
                            Text("Row \(i)")
                                .frame(height: 50)
                                .id(i)
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ViewOffsetKey2.self) { newOffset in
                    let delta = newOffset - previousOffset
                    if abs(delta) > 5 {
                        previousOffset = newOffset
                        yOffset = newOffset
                    }
                    if shouldRestoreScroll {
                        shouldRestoreScroll = false
                        let targetIndex = Int(abs(yOffset) / 50)
                        proxy.scrollTo(targetIndex, anchor: .top)
                    }
                }
                .onRotate { _ in
                    shouldRestoreScroll = true
                }
            }

            Text("Current Y Offset: \(yOffset, specifier: "%.2f")")
        }
    }
}

struct ViewOffsetKey2: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Модификатор для отслеживания поворота устройства
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

#Preview {
    ScrollViewReaderText2()
}
