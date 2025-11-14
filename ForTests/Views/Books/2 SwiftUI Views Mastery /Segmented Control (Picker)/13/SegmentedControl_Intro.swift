//
//  SegmentedControl_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Segmented Control (Picker) — переключатель между вариантами (iOS 13+)

 • Использует Picker с .pickerStyle(.segmented)
 • Каждый сегмент связывается с @State через .tag()
 • Можно использовать текст или изображения
*/

import SwiftUI

struct SegmentedControl_Intro: View {
    @State private var dayNight = "day"
    @State private var tab = 1

    var body: some View {
        VStack(spacing: 20) {
            Text("Segmented Control (Picker)")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("Associate the segmented control with an @State variable that will control which segment is selected. The state variable will match each segment's tag value.")

            // Сегменты с текстом
            Picker("", selection: $dayNight) {
                Text("Day").tag("day")
                Text("Night").tag("night")
            }
            .pickerStyle(.segmented)
            .padding()

            Text("With Images:")

            // Сегменты с изображениями
            Picker("", selection: $tab) {
                Image(systemName: "sun.min").tag(0)
                Image(systemName: "moon").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

#Preview {
    SegmentedControl_Intro()
}
