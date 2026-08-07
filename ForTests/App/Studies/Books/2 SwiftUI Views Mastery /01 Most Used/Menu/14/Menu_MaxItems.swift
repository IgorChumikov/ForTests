//
//  Menu_MaxItems.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Menu — работа с большим количеством элементов (iOS 14+)

 • Menu поддерживает любое количество пунктов — 5, 10, 50 и больше.
 • Если элементов слишком много, система автоматически добавляет прокрутку,
   чтобы меню не выходило за пределы экрана.
 • Никаких дополнительных настроек не требуется — scrolling включается нативно.
 • Удобно для групп длинных списков опций, фильтров, инструментов и команд.
 */


import SwiftUI

struct Menu_MaxItems: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Menu {
                    // 20 пунктов меню
                    ForEach(1...20, id: \.self) { index in
                        Button("Menu Item \(index)", action: {})
                    }
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding(.leading, 20)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Menu_MaxItems()
}
