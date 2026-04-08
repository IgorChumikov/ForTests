//
//  Nav_WithPathAndEnum.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) поддерживает параметр `path`,
который можно связать с массивом значений (например, enum),
чтобы управлять навигацией программно.

 • Enum помогает централизованно описывать все экраны.
 • Добавляя элементы в `navPath`, вы создаёте “цепочку” переходов.
 • `.navigationDestination(for:)` реагирует на каждый тип enum и строит нужный экран.
 
 Такой подход идеально подходит для deep link’ов и восстановления состояния навигации.
 
 */

import SwiftUI

// MARK: - Enum с экранами
enum Screens: Hashable {
    case screen1
    case screen2
    case screen3
}

// MARK: - Основное представление
struct Nav_WithPathAndEnum: View {
    @State private var navPath: [Screens] = [] // path теперь хранит enum-значения
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                
                Button("Deep Link to Screen 2") {
                    navPath.append(.screen1)
                    navPath.append(.screen2)
                }
                
                Button("Deep Link to Screen 3") {
                    navPath.append(.screen1)
                    navPath.append(.screen2)
                    navPath.append(.screen3)
                }
            }
            .navigationTitle("Navigate with Path")
            .navigationDestination(for: Screens.self) { screenEnum in
                navigate(to: screenEnum)
            }
        }
        .font(.title)
    }
    
    // MARK: - Навигация по enum
    @ViewBuilder
    private func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screen1:
            Text("Screen 1")
                .font(.largeTitle)
                .navigationTitle("Screen 1")
        case .screen2:
            Text("Screen 2")
                .font(.largeTitle)
                .navigationTitle("Screen 2")
        case .screen3:
            Text("Screen 3")
                .font(.largeTitle)
                .navigationTitle("Screen 3")
        }
    }
}

#Preview {
    Nav_WithPathAndEnum()
}
