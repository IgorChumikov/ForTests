import SwiftUI
import Combine

struct SwiftUIView: View {
    let detector: CurrentValueSubject<CGFloat, Never>
    let publisher: AnyPublisher<CGFloat, Never>
    
    init() {
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    
    @State private var offset2: CGFloat = 0
    @State private var opacity2: Double = 1
    
    var body: some View {
        VStack {
            Text("Now you see me")
                .padding(20)
                .background(.red)
                .offset(y: offset2)
                .opacity(opacity2)
                //.animation(.easeInOut) // Добавленная анимация для плавности изменений
                .onReceive(publisher) { newValue in
                    print("Received value from publisher: \(newValue)")
                    
                    if newValue >= 50 {
                        withAnimation {
                           // offset2 = -50
                            opacity2 = 0.0
                        }
                    } else if newValue == 0 {
                        withAnimation {
                           // offset2 = -0
                            opacity2 = 0.99
                        }
                    }
                    
                }
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0...100, id: \.self) { i in
                        Rectangle()
                            .frame(width: 200, height: 100)
                            .foregroundColor(.green)
                            .overlay(Text("\(i)"))
                    }
                }
                .frame(maxWidth: .infinity)
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) { detector.send($0) }
            }.coordinateSpace(name: "scroll")
        }
        .padding(.top, 100)
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
