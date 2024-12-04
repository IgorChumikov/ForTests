//
//  IpadTest2SwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

struct IpadTest2SwiftUIView: View {
    @State private var selectedPerson: String? = nil
    let people = ["Angela", "Juan", "Yeji"]

    var body: some View {
        // Проверка устройства: показываем два столбца на iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
            HStack(spacing: 1) {
                // Master View (Список)
                MyMasterView(people: people, selectedPerson: $selectedPerson)
                    .frame(maxWidth: 300) // Фиксируем ширину для левого столбца
                    .background(Color(UIColor.systemGroupedBackground))

                // Divider между списком и деталями
                Divider()
                
                // Details View (Подробности)
                DetailsView(selectedPerson: selectedPerson)
                    .frame(maxWidth: .infinity) // Подробности занимают оставшуюся ширину
            }
        } else {
            // Обычный NavigationView для iPhone
            NavigationView {
                MyMasterView(people: people, selectedPerson: $selectedPerson)
            }
        }
    }
}

struct MyMasterView: View {
    let people: [String]
    @Binding var selectedPerson: String?

    var body: some View {
        List(people, id: \.self) { person in
            Button(action: {
                selectedPerson = person
            }) {
                Text(person)
            }
        }
        .navigationTitle("People")
    }
}

struct DetailsView: View {
    let selectedPerson: String?

    var body: some View {
        VStack {
            if let person = selectedPerson {
                Text("Details for \(person)")
                    .font(.largeTitle)
                Text("More information about \(person).")
                    .font(.subheadline)
            } else {
                Text("Select a person")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    IpadTest2SwiftUIView()
}


