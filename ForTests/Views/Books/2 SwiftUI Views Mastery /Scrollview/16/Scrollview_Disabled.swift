//
//  Scrollview_Disabled.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — отключение прокрутки (iOS 16+)
 
 • Модификатор `.scrollDisabled(_:)` позволяет включать или выключать прокрутку
   в зависимости от переданного булевого значения.
 • Удобно для временной блокировки прокрутки при показе модалей, обработке ввода и т.п.
 • В этом примере используется `Toggle` внутри `.safeAreaInset`, чтобы управлять состоянием.
 
 */

import SwiftUI

struct ScrollView_Disabled: View {
    @State private var disableScroll = false
    var items = [Color.green, .blue, .purple, .pink, .yellow, .orange]
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            ForEach(items, id: \.self) { color in
                RoundedRectangle(cornerRadius: 15)
                    .fill(color)
                    .frame(height: 200)
                    .padding(.horizontal)
                    .shadow(radius: 4, y: 2)
            }
        }
        // MARK: - Отключение прокрутки
        .scrollDisabled(disableScroll)
        
        // MARK: - Нижняя панель с переключателем
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 10) {
                Text("You can disable scrolling with a modifier that passes in a boolean.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Toggle("Disable Scrolling", isOn: $disableScroll)
                    .padding()
                    .tint(.blue)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
        }
        .font(.title)
        .padding(.bottom)
    }
}

#Preview {
    ScrollView_Disabled()
}
