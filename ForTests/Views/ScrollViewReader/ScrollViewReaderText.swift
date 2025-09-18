import SwiftUI

struct TopVisibleKey: PreferenceKey {
    static var defaultValue: Int? = nil
    static func reduce(value: inout Int?, nextValue: () -> Int?) {
        // сохраняем первый (верхний) id, если он есть
        
        print("TopVisibleKey \(value)")
        if value == nil { value = nextValue() }
    }
}

struct ScrollViewReaderText: View {
    @Namespace var topID
    @Namespace var bottomID
    
    @State private var topVisible: Int? = nil
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(1...100, id: \.self) { number in
                        Text("Элемент \(number)")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(50)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue.opacity(0.2))
                            )
                            .id(number)
                            // отслеживаем позицию элемента
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .preference(
                                            key: TopVisibleKey.self,
                                            value: geo.frame(in: .named("scroll")).minY >= 0
                                                ? number
                                                : nil
                                        )
                                }
                            )
                        Divider()
                    }
                }
                .padding()
            }
            .coordinateSpace(name: "scroll")
            // сохраняем верхний видимый элемент
            .onPreferenceChange(TopVisibleKey.self) { value in
                if let v = value {
                    topVisible = v
                }
            }
            // при повороте скроллим к верхнему
            .onReceive(NotificationCenter.default.publisher(
                for: UIDevice.orientationDidChangeNotification
            )) { _ in
                if let id = topVisible {
                    withAnimation {
                        proxy.scrollTo(id, anchor: .top)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderText()
}
