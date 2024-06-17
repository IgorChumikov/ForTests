//
//  MenuSwiftUIView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.06.2024.
//

import SwiftUI

struct MenuSwiftUIView2: View {
    var body: some View {
        List {
            HStack {
                Text("Cell content")
                Spacer()
                Menu(content: {
                    Button(action: { }) {
                        Text("Бухгалтерия и финансы в некоммерческих организациях")
                            .lineLimit(nil) // Убираем ограничение на количество строк
                            .fixedSize(horizontal: false, vertical: true) // Разрешаем тексту расширяться по вертикали
                        Image(systemName: "command")
                    }
                    Button(action: { }) {
                        Text("Бухгалтерия и финансы в коммерческих организациях")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Image(systemName: "option")
                    }
                    Button(action: { }) {
                        Text("Бухгалтерия")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Image(systemName: "shift")
                    }
                }) {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .padding()
                }
            }
            .background(Color(.systemBackground))
            .onTapGesture {
                print("Cell tapped")
            }
        }
    }
}

#Preview {
    MenuSwiftUIView2()
}
