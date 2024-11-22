//
//  ContentOneeStructView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 05.11.2024.
//

import SwiftUI

// Структура, содержащая состояние
struct Counterstruct {
    var count: Int = 0
}

struct ContentOneeStructView: View {
    // Используем @State для наблюдения за изменениями в структуре Counter
    @State private var counter = Counterstruct()

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
    ContentOneeStructView()
}
