//
//  NavLink_isPresented.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationLink внутри .sheet (iOS 16+) может быть **неактивен** —
система не позволяет выполнять навигацию напрямую из модального окна.
 
 ✅ Решение:
использовать `.navigationDestination(isPresented:)` **снаружи** `.sheet`.
При этом навигация запускается программно через изменение состояния `@State`.
 
 Важно:
 • `.navigationDestination(isPresented:)` должен находиться **вне** `.sheet`.
 • При нажатии кнопки внутри шторки мы закрываем её и активируем навигацию.
 
 */

import SwiftUI

struct NavLink_isPresented: View {
    @State private var showSheet = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button("Show Sheet") { showSheet.toggle() }
                    .buttonStyle(.borderedProminent)
                
                Text("""
                At this time, when a NavigationLink is used inside a sheet, it will be disabled.
                The solution is to use a Button + navigationDestination(isPresented:).
                """)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }
            .navigationTitle("Navigate When True")
            
            // MARK: Sheet presentation
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 16) {
                    NavigationLink(destination: Text("Destination from Link")) {
                        Text("Navigation Link (Disabled)")
                    }
                    .disabled(true) // не работает из-за ограничения
                    
                    Button("Button Link") {
                        showSheet = false      // закрываем шторку
                        navigate = true        // активируем навигацию
                    }
                    .buttonStyle(.borderedProminent)
                }
                .presentationDetents([.height(240)])
            }
            
            // MARK: External navigation trigger
            .navigationDestination(isPresented: $navigate) {
                Text("Destination from Button")
                    .font(.largeTitle)
            }
        }
        .font(.title)
    }
}

#Preview {
    NavLink_isPresented()
}
