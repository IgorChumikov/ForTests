//
//  Nav_WithNavigationPath.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationPath (iOS 16+) — это универсальный контейнер,
который позволяет хранить **разные типы данных** для навигации в NavigationStack.
 
 В отличие от `NavigationStack(path: [Type])`, где тип фиксированный,
`NavigationPath` может содержать **множество разных типов** (например, `Product` и `CreditCard`).
 
 Для каждого типа нужно определить отдельный `.navigationDestination(for:)`.
 
 */

import SwiftUI

// MARK: - Модели для навигации
struct ProductForNav: Hashable {
    var name: String
    var price: Double
}

struct CreditCardForNav: Hashable {
    var number: String
    var expiration: String
}

// MARK: - Основной экран
struct Nav_WithNavigationPath: View {
    @State private var product = ProductForNav(name: "Mouse", price: 24.99)
    @State private var cc = CreditCardForNav(number: "5111 1111 1111 1111", expiration: "02/28")
    @State private var navPath = NavigationPath() // универсальный контейнер
    
    var body: some View {
        NavigationStack(path: $navPath) {
            Form {
                // Навигация к продукту
                NavigationLink(value: product) {
                    Text(product.name)
                }
                
                // Навигация к кредитной карте
                NavigationLink(value: cc) {
                    Text(cc.number)
                }
            }
            .navigationTitle("Order")
            
            // MARK: - Навигация для Product
            .navigationDestination(for: ProductForNav.self) { product in
                Form {
                    Text(product.name)
                    Text(product.price, format: .currency(code: "USD"))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Product Details")
            }
            
            // MARK: - Навигация для CreditCard
            .navigationDestination(for: CreditCardForNav.self) { cc in
                Form {
                    Text(cc.number)
                    Text(cc.expiration)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Credit Card Details")
            }
        }
        .font(.title)
    }
}

#Preview {
    Nav_WithNavigationPath()
}
