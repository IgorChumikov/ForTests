//
//  Navigation_DisplayMode.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) поддерживает настройку отображения заголовка
через `.navigationBarTitleDisplayMode(_:)`.
 
 • `.automatic` — система сама выбирает стиль (по умолчанию).
 • `.inline` — заголовок размещается в строке навбара.
 • `.large` — отображается крупный заголовок, как на экранах настроек.
 
 */

import SwiftUI

struct Navigation_DisplayMode: View {
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                Spacer()
            }
            .navigationTitle("Inline Display Mode")
            .navigationBarTitleDisplayMode(.inline) // компактный режим заголовка
        }
    }
}

#Preview {
    Navigation_DisplayMode()
}
