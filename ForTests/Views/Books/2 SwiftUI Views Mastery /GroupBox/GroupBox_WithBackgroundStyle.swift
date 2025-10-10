//
//  GroupBox_WithBackgroundStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.

// IOS 16

import SwiftUI

struct GroupBox_WithBackgroundStyle: View {
    var body: some View {
        VStack(spacing: 45) {
            
            // 1️⃣ GroupBox с Label и фоновым стилем .thinMaterial
            GroupBox(label: Label("Profile", systemImage: "person.circle")) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Big Mountain Studio")
                        .font(.title2)
                    
                    Link("Learn More", destination: URL(string: "https://bigmountainstudio.com")!)
                        .buttonStyle(.borderedProminent)
                        .font(.title3)
                }
                .padding(.top, 8)
            }
            .backgroundStyle(.thinMaterial)
            
            Text("Use the backgroundStyle modifier to apply styles to a GroupBox.")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            // 2️⃣ GroupBox с цветным backgroundStyle
            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Big Mountain Studio")
                        .font(.title2)
                        .padding(.bottom, 4)
                    Text("Use width: 214")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            } label: {
                Label("Profile", systemImage: "person.circle")
            }
            .frame(width: 214)
            .foregroundStyle(.white)
            .backgroundStyle(.secondary)
            
            Text("""
            Styles can be colors, gradients, materials (blurs),
            system colors (.primary, .background),
            or hierarchical (.secondary, .tertiary, etc.).
            """)
            .font(.body)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
        .background(
            Image("Fire") // ← замени на имя твоего изображения в Assets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .font(.title3)
        .padding()
    }
}

#Preview {
    GroupBox_WithBackgroundStyle()
}
