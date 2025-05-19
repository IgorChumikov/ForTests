//
//  PopoverNotificationView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

struct PopoverNotificationView: View {
    
    @State private var show = true
    
    var body: some View {
        Button("Open Popover") {
            self.show = true
        }
        .buttonStyle(.borderedProminent)
        .popover(isPresented: $show) {
            content
                .presentationCompactAdaptation(.popover)
                .presentationBackground(Color(red: 1.0, green: 0.97, blue: 0.80))
        }
    }
    
    private var content: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "bolt.fill")
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .background(Circle().fill(Color.red))
            VStack(alignment: .leading, spacing: 4) {
                Text("Произошли изменения в документах на контроле.")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Text("Нажмите для просмотра")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    PopoverNotificationView()
}
