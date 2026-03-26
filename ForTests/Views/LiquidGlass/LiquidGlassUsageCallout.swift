//
//  LiquidGlassUsageCallout.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

@available(iOS 26.0, *)
struct LiquidGlassUsageCallout: View {

    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title3.bold())
                .multilineTextAlignment(.center)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 18)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 28))
        .padding(.horizontal)
    }
}
