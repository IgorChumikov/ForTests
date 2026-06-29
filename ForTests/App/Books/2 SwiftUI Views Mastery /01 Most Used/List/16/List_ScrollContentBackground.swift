//
//  List_ScrollContentBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 scrollContentBackground — управление системным фоном списка (iOS 16+)

 • По умолчанию List имеет собственный системный фон, который перекрывает ваше .background().
 • Модификатор .scrollContentBackground(.hidden / .visible) позволяет отключать или включать этот фон.
 • Полезно, когда нужно сделать List прозрачным, наложить градиент, изображение или кастомный цвет.
 • Работает только в контейнерах со скроллом (List, ScrollView).
 • Состояние можно переключать динамически — отличный способ для темизации и эффектов.
 */


import SwiftUI

struct List_ScrollContentBackground: View {
    private var stringArray = ["Evans", "Lemuel", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    @State private var show = false
    @State private var showSystemBackground: Visibility = .visible

    var body: some View {
        List(stringArray, id: \.self) { string in
            Text(string)
        }
        .background(Color.green.opacity(0.25))
        .scrollContentBackground(showSystemBackground)
        .safeAreaInset(edge: .bottom) {
            VStack {
                Divider()
                
                Button {
                    show.toggle()
                    showSystemBackground = show ? .hidden : .visible
                } label: {
                    if show {
                        Image(systemName: "eye.slash")
                    } else {
                        Image(systemName: "eye")
                            .buttonStyle(.borderedProminent)
                    }
                }
                .symbolVariant(.fill)
                .padding()
            }
            .background(.thinMaterial)
        }
        .font(.title)
    }
}


#Preview {
    List_ScrollContentBackground()
}
