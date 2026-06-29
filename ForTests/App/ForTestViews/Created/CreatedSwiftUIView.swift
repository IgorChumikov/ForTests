//
//  CreatedSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

// MARK: - PushNotificationControlBannerView

struct PushNotificationControlBannerView: View {
    
    // MARK: - Content
    
    var body: some View {
        Button {
            
        } label: {
            content
        }
    }
    
    // MARK: - Views
    
    private var content: some View {
        HStack(alignment: .center, spacing: .zero) {
            notificationText
            Spacer()
            notificationToggle
        }
        .padding(.horizontal, 20)
        .frame(height: 76)
        .background(Color.yellow.opacity(0.3))
       
    }
    
    private var notificationText: some View {
        Text("Получать пуш-уведомления об\nизменениях в документах")
            .font(.system(size: 17))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
    }
    
    private var notificationToggle: some View {
        Toggle("", isOn: .constant(false))
            .labelsHidden()
            .disabled(true)
    }
}

// MARK: - PushNotificationControlBannerView_Preview

#Preview {
    PushNotificationControlBannerView()
}
