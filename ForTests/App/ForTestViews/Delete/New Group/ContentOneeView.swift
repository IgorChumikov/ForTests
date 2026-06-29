//
//  ContentOneeView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 05.11.2024.
//

import SwiftUI

// Класс, соответствующий протоколу ObservableObject
class Counter: ObservableObject {
    @Published var count: Int = 0
}

struct ContentOneeView: View {
    // Используем @ObservedObject для наблюдения за изменениями в классе Counter
    @StateObject var counter = Counter()

    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
        }
    }
}

#Preview {
    ContentOneeView()
}
