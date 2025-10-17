//
//  Menu_MaxItems.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 (iOS 14+)
 Menu может содержать большое количество элементов.
Если их слишком много, система автоматически добавит прокрутку,
чтобы пользователь мог видеть все пункты.
 
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
