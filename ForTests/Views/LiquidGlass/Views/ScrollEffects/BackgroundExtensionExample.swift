//
//  BackgroundExtensionExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates .backgroundExtensionEffect() which duplicates,
/// mirrors, and blurs views to create the impression that content
/// extends under sidebars and inspectors.
@available(iOS 26.0, *)
struct BackgroundExtensionExample: View {

    @State private var showExtension = true

    var body: some View {
        VStack(spacing: 0) {
            Toggle("Background Extension", isOn: $showExtension)
                .padding()

            NavigationSplitView {
                List {
                    ForEach(1...10, id: \.self) { index in
                        Label("Category \(index)", systemImage: "folder.fill")
                    }
                }
                .navigationTitle("Sidebar")
            } detail: {
                ZStack {
                    // Colorful content
                    LinearGradient(
                        colors: [.orange, .pink, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Image(systemName: "photo.artframe")
                            .font(.system(size: 80))
                            .foregroundStyle(.white)

                        Text("Detail Content")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)

                        Text("Toggle the switch to see backgroundExtensionEffect")
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .if(showExtension) { view in
                    view.backgroundExtensionEffect()
                }
            }
        }
        .navigationTitle("Background Extension")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        BackgroundExtensionExample()
    }
}
