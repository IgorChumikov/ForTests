//
//  ProgressView_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView (iOS 14+)
 
 • Используется для отображения состояния загрузки или выполнения задачи.
 • Если не передавать параметры, отображается **индетерминированный спиннер** (крутящийся индикатор без прогресса).
 • Можно добавить метку (label) и настроить стиль, шрифт и цвет.
 
 */

import SwiftUI

struct ProgressView_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Introduction",
                desc: "Use ProgressView to show that some activity is happening. If you do not pass in any values, it will just show an indeterminate spinner.",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Индикатор без значений (индетерминированный)
            ProgressView()
            
            DescView2(
                desc: "You can add a label to it as well:",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Индикатор с текстовой меткой
            ProgressView("Loading…")
                .font(Font.system(.title2, design: .monospaced).weight(.bold))
            
            DescView2(
                desc: "Which, as you can see, can be customized.",
                back: .blue,
                textColor: .white
            )
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_Intro()
}

/// Универсальное описание для блока примеров (аналогично HeaderView)
struct DescView2: View {
    let desc: String
    let back: Color
    let textColor: Color
    
    var body: some View {
        Text(desc)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(back.opacity(0.15))
            .cornerRadius(12)
            .padding(.horizontal)
    }
}
