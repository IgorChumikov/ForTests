//
//  SwiftUIView123231.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.06.2024.
//

import SwiftUI

struct SwiftUIView123231: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8) {
                Text("Введите СМС код")
                    .font(.headline)
                TextField("Sms code....", text: $text)
                    .frame(width: 100 , height: 40)
                    .padding(9)
                    .background(Color.green)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.7), radius: 10, x: 0, y: 5)
            }
        }
    }
}

#Preview {
    SwiftUIView123231()
}
