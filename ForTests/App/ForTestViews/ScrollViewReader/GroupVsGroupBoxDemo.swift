//
//  GroupVsGroupBoxDemo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 25.09.2025.
//

import SwiftUI

struct GroupVsGroupBoxDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: - Group (невидимый контейнер)
            Text("Пример с Group")
                .font(.headline)
            
            Group {
                Text("Элемент 1")
                Text("Элемент 2")
            }
            .foregroundColor(.blue)
            
            Divider()
            
            // MARK: - GroupBox (видимый контейнер)
            Text("Пример с GroupBox")
                .font(.headline)
            
            GroupBox("Настройки") {
                VStack(alignment: .leading) {
                    Toggle("Уведомления", isOn: .constant(true))
                    Toggle("Темная тема", isOn: .constant(false))
                }
                .padding(.top, 4)
            }
        }
        .padding()
    }
}

#Preview {
    GroupVsGroupBoxDemo()
}
