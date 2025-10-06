//
//  ScrollViewReaderText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.09.2025.
//

import SwiftUI

struct ScrollViewReaderText: View {
    @State private var previousOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ViewOffsetKey.self, value: geo.frame(in: .named("scroll")).minY)
                    }
                    .frame(height: 0) // invisible

                    ForEach(0..<100, id: \.self) { i in
                        Text("Row \(i)")
                            .frame(height: 50)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ViewOffsetKey.self) { newOffset in
                let delta = newOffset - previousOffset
                if abs(delta) > 5 { // чтобы избежать мелких дерганий
                    if delta < 0 {
                        print("Scrolling down")
                    } else {
                        print("Scrolling up")
                    }
                    previousOffset = newOffset
                    yOffset = newOffset
                }
            }

            Text("Current Y Offset: \(yOffset, specifier: "%.2f")")
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ScrollViewReaderText()
}
