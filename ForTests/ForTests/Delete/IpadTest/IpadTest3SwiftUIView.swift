//
//  IpadTest3SwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

// GeometryReader

struct IpadTest3SwiftUIView: View {
    @State private var selectedPerson: String? = nil
    let people = ["Angela", "Juan", "Yeji"]

    var body: some View {
        GeometryReader { geometry in
            if UIDevice.current.userInterfaceIdiom == .pad {
                HStack(spacing: 1) {
                    // Master View (Список)
                    MyMasterView(people: people, selectedPerson: $selectedPerson)
                        .frame(width: geometry.size.width * 0.3) // 30% ширины для списка
                        .background(Color(UIColor.systemGroupedBackground))
                    
                    // Divider между списком и деталями
                    Divider()
                    
                    // Details View (Подробности)
                    DetailsView(selectedPerson: selectedPerson)
                        .frame(width: geometry.size.width * 0.7) // 70% ширины для деталей
                }
            } else {
                // Обычный NavigationView для iPhone
                NavigationView {
                    MyMasterView(people: people, selectedPerson: $selectedPerson)
                }
            }
        }
    }
}

#Preview {
    IpadTest2SwiftUIView()
}
