//
//  List_ScrollContentBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 По умолчанию List в SwiftUI имеет системный фон, который перекрывает пользовательский .background().
 Модификатор .scrollContentBackground(_:) (добавлен в iOS 16) позволяет управлять видимостью этого системного фона.
 
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
