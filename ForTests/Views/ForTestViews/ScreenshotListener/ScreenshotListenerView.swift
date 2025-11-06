//
//  ScreenshotListenerView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.11.2025.
//

import SwiftUI

struct ScreenshotListenerView: View {
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            // Твой основной контент
            VStack(spacing: 20) {
                Image(systemName: "doc.text.image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .foregroundColor(.blue)
                
                Text("Попробуй сделать скриншот 👇")
                    .font(.title2.weight(.semibold))
                    .multilineTextAlignment(.center)
            }
        }
        // 👇 Привязываем шторку SwiftUI
        .sheet(isPresented: $showSheet) {
            ScreenshotSheet(showSheet: $showSheet)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        // 👇 Реакция на системное уведомление о скриншоте
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIApplication.userDidTakeScreenshotNotification,
                object: nil,
                queue: .main
            ) { _ in
                showSheet = true
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(
                self,
                name: UIApplication.userDidTakeScreenshotNotification,
                object: nil
            )
        }
    }
}

// MARK: - Шторка SwiftUI
struct ScreenshotSheet: View {
    @Binding var showSheet: Bool
    @State private var copied = false
    
    var body: some View {
        VStack(spacing: 18) {
            Capsule()
                .frame(width: 36, height: 5)
                .opacity(0.25)
                .padding(.top, 8)
            
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "link.circle.fill")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.blue, .white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Совет")
                        .font(.headline)
                    Text("Лучше отправить ссылку, чтобы получатель мог открыть документ целиком — а не только картинку.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                Button {
                    UIPasteboard.general.string = "https://example.com/document/123"
                    copied = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        copied = false
                    }
                } label: {
                    HStack {
                        Image(systemName: copied ? "checkmark.circle.fill" : "doc.on.clipboard")
                            .foregroundColor(.blue)
                        Text(copied ? "Скопировано!" : "Скопировать ссылку")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial))
                }
                
                Button(role: .destructive) {
                    showSheet = false
                } label: {
                    HStack {
                        Image(systemName: "camera")
                        Text("Отправить скриншот всё равно")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.secondary.opacity(0.15)))
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
}

// MARK: - Превью
#Preview {
    ScreenshotListenerView()
}
