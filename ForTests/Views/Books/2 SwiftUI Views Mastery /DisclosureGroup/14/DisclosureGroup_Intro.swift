//
//  DisclosureGroup_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 DisclosureGroup — раскрывающиеся секции и список (iOS 14+)

 • Позволяет создавать collapsible-контейнеры, которые скрывают или показывают вложенный контент.
 • Работает как «раскрывающийся список»: по нажатию заголовка секция открывается или закрывается.
 • Поддерживает биндинг через isExpanded для ручного управления состоянием.
 • Можно настраивать label и контент, добавлять иконки, кастомную разметку и вложенные вью.
 • Удобно для настроек, FAQ-секции, фильтров и группированной информации.
 */


import SwiftUI

struct DisclosureGroup_Intro: View {
    @State private var disclosureExpanded = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "DisclosureGroup",
                subtitle: "Introduction",
                desc: "Use the DisclosureGroup when you want to expand or collapse other views."
            )
            
            VStack(spacing: 20) {
                DisclosureGroup("More Info", isExpanded: $disclosureExpanded) {
                    Text("Tap the row to expand/collapse the content of the DisclosureGroup. DisclosureGroups are collapsed by default.")
                        .padding(.top, 8)
                }
                
                DisclosureGroup {
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.orange)
                        Text("You can use another initializer to customize your label too.")
                    }
                    .padding(.top, 8)
                } label: {
                    Text("More Info")
                        .bold()
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    DisclosureGroup_Intro()
}
