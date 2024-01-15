//
//  SwiftUIView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

// ScrollOffsetNamespace
enum ScrollOffsetNamespace {
    static let namespace = "scrollView"
}

// ScrollOffsetPreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

// ScrollViewOffsetTracker
struct ScrollViewOffsetTracker: View {
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geo.frame(in: .named(ScrollOffsetNamespace.namespace)).origin
                )
        }
        .frame(height: 0)
    }
}

// ScrollView extension
private extension ScrollView {
    func withOffsetTracking(action: @escaping (_ offset: CGPoint) -> Void) -> some View {
        self.coordinateSpace(name: ScrollOffsetNamespace.namespace)
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: action)
    }
}

// ScrollViewWithOffset
public struct ScrollViewWithOffset<Content: View>: View {
    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        onScroll: ScrollAction? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.onScroll = onScroll ?? { _ in }
        self.content = content
    }

    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let onScroll: ScrollAction
    private let content: () -> Content

    public typealias ScrollAction = (_ offset: CGPoint) -> Void

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            ZStack(alignment: .top) {
                ScrollViewOffsetTracker()
                content()
            }
        }.withOffsetTracking(action: onScroll)
    }
}

// Example Usage
struct MyView: View {
    @State private var scrollOffset: CGPoint = .zero

    var body: some View {
        NavigationView {
            ScrollViewWithOffset(onScroll: handleScroll) {
                LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                    Text("LogoPanel")
                    .padding()
                    .background(.blue)
                    Section {
                        ForEach(1...100, id: \.self) {
                            Divider().background(Color.red)
                            Text("\($0)").frame(maxWidth: .infinity)
                        }
                    } header: {
                       Text("header")
                            .padding(.horizontal, 150)
                            .background(.brown)
                        
                    }
                }
                
          
            }.navigationTitle("Offset: \(Int(scrollOffset.y))")
        }
    }

    func handleScroll(_ offset: CGPoint) {
        self.scrollOffset = offset
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
