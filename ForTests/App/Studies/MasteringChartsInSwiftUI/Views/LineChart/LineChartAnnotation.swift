//
//  LineChartAnnotation.swift
//  MasteringChartsInSwiftUI4
//
//  Created by Игорь Чумиков on 21.07.2025.
//

import Charts
import SwiftUI

struct LineChartAnnotation: View {
    @State private var walkWorkouts = Workout.walkWorkouts
    
    var body: some View {
        VStack {
            Text("DevTechie")
                .font(.largeTitle)
                .foregroundColor(.primary)
            
            Chart {
                ForEach(walkWorkouts) { workout in
                    LineMark(
                        x: .value("Day", workout.day),
                        y: .value("Workout(in minutes)", workout.minutes)
                    )
                    .lineStyle(.init(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .annotation {
                        Text("🚶")
                            .font(.largeTitle)
                    }
                }
                .foregroundStyle(Gradient(colors: [.yellow, .orange, .pink]))
            }
            .frame(height: 400)
            .padding()
        }
    }
}

struct LineChartAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        LineChartAnnotation()
    }
}
