//
//  NavigationController_Test.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationController — вспомогательный класс, который централизует логику навигации.
 
 ✅ Подходит, если:
 1. Не нужно передавать данные между экранами.
 2. Всем экранам достаточно одного общего состояния или глобальных данных.
 3. Вы хотите отделить логику навигации от UI.
 
 Метод `navigate(to:)` возвращает нужное представление для указанного экрана enum Screens.
 
 */

/*
 
 NavigationStack + Enum + NavigationController (iOS 16+)
 
 Этот пример демонстрирует:
 • Централизованное управление навигацией через enum `Screens`.
 • Использование `NavigationController.navigate(to:)` для возврата соответствующего экрана.
 • Программное добавление путей в `navPath` для реализации deep link’ов.
 
 Такой подход удобен для:
 – построения больших приложений с типобезопасной навигацией;
 – централизованного контроля переходов;
 – удобной поддержки deep linking и восстановления состояния.
 
 */

import SwiftUI


// MARK: - Контроллер навигации
final class NavigationController_Test {
    /// Возвращает экран для выбранного case
    @ViewBuilder
    static func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screen1:
            Image(systemName: "1.square.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green)
                .navigationTitle("Screen 1")
            
        case .screen2:
            Image(systemName: "2.square.fill")
                .font(.system(size: 80))
                .foregroundStyle(.red)
                .navigationTitle("Screen 2")
            
        case .screen3:
            Image(systemName: "3.square.fill")
                .font(.system(size: 80))
                .foregroundStyle(.purple)
                .navigationTitle("Screen 3")
        }
    }
}

// MARK: - Основной экран с NavigationStack
struct Nav_NavigationController_Test: View {
    @State private var navPath: [Screens] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                
                Button("Deep Link to Screen 1") {
                    navPath.append(.screen1)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                
                Button("Deep Link to Screen 2") {
                    navPath.append(.screen2)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Deep Link to Screen 3") {
                    navPath.append(.screen3)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .navigationTitle("Navigate with Path")
            .navigationDestination(for: Screens.self) { screen in
                NavigationController_Test.navigate(to: screen)
            }
        }
        .font(.title)
    }
}

#Preview {
    Nav_NavigationController_Test()
}
