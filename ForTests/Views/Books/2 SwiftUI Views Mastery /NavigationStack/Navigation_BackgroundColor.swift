//
//  Navigation_BackgroundColor.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16) позволяет легко задать фоновый цвет для экрана.
 
 Чтобы цвет занимал всё пространство, включая под навигационной панелью,
нужно использовать `.ignoresSafeArea()`.
 
 В этом примере ZStack накладывает два слоя цвета:
 • нижний — зелёный (основной фон);
 • верхний — серый с прозрачностью.
 
 */

import SwiftUI

struct Navigation_BackgroundColor: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.25)
                    .ignoresSafeArea() // фон под навигационной панелью
                
                Color.gray.opacity(0.25)
            }
            .navigationTitle("Background Color")
        }
    }
}

#Preview {
    Navigation_BackgroundColor()
}
