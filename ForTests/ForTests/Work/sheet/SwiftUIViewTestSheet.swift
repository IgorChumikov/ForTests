//
//  SwiftUIViewTestSheet.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2025.
//

// Только с 16

import SwiftUI

@available(iOS 16.0, *)
struct SwiftUIViewTestSheet: View {
    @State private var isShowingTravelModes = false

    var body: some View {
        VStack {
            Text("Выбор способа передвижения")
                .font(.title)
                .padding()

            Button("Открыть варианты") {
                isShowingTravelModes = true
            }
            .padding()
        }
        .sheet(isPresented: $isShowingTravelModes) {
            travelOptionView
                .presentationDetents([.height(500)])
        }
    }

    var travelOptionView: some View {
        VStack {
            Text("Выберите способ путешествия")
                .font(.headline)
                .padding()

            List {
                Text("🚗 Машина")
                Text("🚆 Поезд")
                Text("✈️ Самолет")
                Text("🚌 Автобус")
                Text("🚲 Велосипед")
            }

            Button("Закрыть") {
                isShowingTravelModes = false
            }
            .padding()
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    SwiftUIViewTestSheet()
}
