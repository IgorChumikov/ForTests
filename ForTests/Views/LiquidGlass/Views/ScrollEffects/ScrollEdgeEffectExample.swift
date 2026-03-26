//
//  ScrollEdgeEffectExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates scroll edge effects which provide a transition
/// between content and Liquid Glass controls.
/// Styles: .automatic, .soft (subtle), .hard (stronger boundary)
@available(iOS 26.0, *)
struct ScrollEdgeEffectExample: View {

    @State private var selectedStyle = 0

    private let items = (1...50).map { "Item \($0)" }

    var body: some View {
        VStack(spacing: 0) {
            // Style picker
            Picker("Edge Style", selection: $selectedStyle) {
                Text("Automatic").tag(0)
                Text("Soft").tag(1)
                Text("Hard").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()

            // Scroll view with edge effect
            Group {
                switch selectedStyle {
                case 1:
                    scrollContent
                        .scrollEdgeEffectStyle(.soft, for: .all)
                case 2:
                    scrollContent
                        .scrollEdgeEffectStyle(.hard, for: .all)
                default:
                    scrollContent
                        .scrollEdgeEffectStyle(.automatic, for: .all)
                }
            }
        }
        .navigationTitle("Scroll Edge Effect")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // Action
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
                .buttonStyle(.glass)
            }
        }
    }

    private var scrollContent: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Image(systemName: "doc.fill")
                            .foregroundStyle(.blue)
                        Text(item)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(.regularMaterial, in: .rect(cornerRadius: 12))
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        ScrollEdgeEffectExample()
    }
}
