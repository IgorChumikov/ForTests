//
//  ScrollViewReader_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ScrollViewReader — программная прокрутка ScrollView (iOS 14+)

 • Позволяет получить доступ к scrollTo(_:anchor:) через прокси.
 • Даёт возможность прокручивать ScrollView к конкретному элементу по его id.
 • Удобно для кнопок «Вверх/Вниз», автопрокрутки чатов, списков и лент.
 • Требует установки .id() на элементы внутри ScrollView.
 */

import SwiftUI

struct ScrollViewReader_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView(
                "ScrollViewReader",
                subtitle: "Introduction",
                desc: "Use the ScrollViewReader to access the scrollTo function so you can programmatically scroll to a specific view."
            )
            
            ScrollViewReader { scrollViewProxy in
                Button("Scroll To Bottom") {
                    withAnimation {   scrollViewProxy.scrollTo(50, anchor: .bottom) }
                }
                
                ScrollView {
                    ForEach(1..<51) { index in
                        getImage(for: index)
                            .font(.largeTitle)
                            .frame(height: 70)
                            .id(index)
                    }
                }
                
                Button("Scroll To Top") {
                    withAnimation { scrollViewProxy.scrollTo(1, anchor: .top) }
                }
            }
        }
        .font(.title)
    }
    
    private func getImage(for index: Int) -> some View {
        if index == 1 || index == 50 {
            return Image(systemName: "\(index).square.fill")
                .foregroundStyle(Color.red)
        }
        return Image(systemName: "\(index).square")
            .foregroundStyle(Color.primary)
    }
}

#Preview {
    ScrollViewReader_Intro()
}
