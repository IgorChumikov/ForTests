//
//  Scrollview_ScrollBounceBehavior.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — настройка поведения bounce (iOS 16+)
 
 • По умолчанию ScrollView всегда «отскакивает» при достижении края.
 • Модификатор `.scrollBounceBehavior(_:)` позволяет управлять этим эффектом:
   - `.automatic` — стандартное поведение (отскакивает всегда).
   - `.basedOnSize` — bounce активен только если контент превышает размер контейнера.
   - `.never` — полностью отключает отскок.
 
 */

import SwiftUI

struct ScrollView_ScrollBounceBehavior: View {
    var body: some View {
        VStack(spacing: 24) {
            
            GroupBox {
                ScrollView {
                    Text("The ScrollView will bounce by default")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .frame(maxWidth: .infinity)
            }
            
            GroupBox {
                ScrollView {
                    Text("This ScrollView will only bounce when contents exceed bounds")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .scrollBounceBehavior(.basedOnSize)
            }
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    ScrollView_ScrollBounceBehavior()
}
