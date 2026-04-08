//
//  OutlineGroup_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 OutlineGroup (iOS 14+) позволяет визуально отображать иерархические данные
(например, дерево или структуру каталогов) с возможностью сворачивания и раскрытия уровней.

 • Похож на `List` с параметром `children:`, но сам не скроллится.
 • Удобен для отображения вложенных данных внутри `VStack`, `ScrollView` и т.п.
 • Каждый элемент, имеющий потомков (`children`), автоматически принимает цвет `.tint`.

 */

import SwiftUI

struct OutlineGroup_Intro: View {
    
    // MARK: - Пример данных
    var parents = [
        Parent(name: "Mark", children: [Parent(name: "Paola")]),
        Parent(name: "Rodrigo", children: [
            Parent(name: "Kai"),
            Parent(name: "Brennan"),
            Parent(name: "Easton")
        ]),
        Parent(name: "Marcella", children: [
            Parent(name: "Sam", children: [Parent(name: "Joe")]),
            Parent(name: "Melissa"),
            Parent(name: "Melanie")
        ])
    ]
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView3(
                title: "OutlineGroup",
                subtitle: "Introduction",
                desc: """
                This is very similar to using the List with the children parameter,
                except this container does not scroll.
                """,
                back: .red,
                textColor: .primary
            )
            
            OutlineGroup(parents, children: \.children) { parent in
                HStack {
                    Image(systemName: "person.circle")
                    Text(parent.name)
                    Spacer()
                }
            }
            .padding(.horizontal)
            .tint(.red)
        }
        .font(.title)
    }
}

#Preview {
    OutlineGroup_Intro()
}
