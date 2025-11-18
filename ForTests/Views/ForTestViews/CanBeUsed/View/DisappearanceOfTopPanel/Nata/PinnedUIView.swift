//
//  PinnedUIView.swift
//

import SwiftUI

private enum HeaderPanelConstants {
    static let visibilityAnimation: Animation = .linear(duration: 0.3)
}

struct PinnedUIView: View {
    @State private var isScrollingUp = true
    
    var body: some View {
        ScrollDirectionView(isScrollingUp: $isScrollingUp) {
            LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                SectionView(isScrollingUp: isScrollingUp)
            }
            .padding(.bottom)
        }
        .animation(HeaderPanelConstants.visibilityAnimation, value: isScrollingUp)
        .clipped()
    }
}


extension PinnedUIView {
    struct SectionView: View {
        let isScrollingUp: Bool
        var body: some View {
            Section(header: LogoView(isScrollingUp: isScrollingUp)) {
                VStack(spacing: 32) {
                    ForEach(0..<100) { item in
                        Text("Item \(item)")
                    }
                }
            }
        }
    }
}

struct LogoView: View {
    let isScrollingUp: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
            Text("Самая лучшая компания")
        }
        .padding()
        .background(.green)
        .frame(height: isScrollingUp ? nil : .zero, alignment: .top)
        .clipped()
    }
}
