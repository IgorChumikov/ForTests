//
//  LineChartExample.swift
//  MasteringChartsInSwiftUI4
//
//  Created by Игорь Чумиков on 21.07.2025.
//

import Charts
import SwiftUI

struct LineChartExample: View {
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
                }
            }
            .frame(height: 400)
            .padding()
        }
    }
}

struct LineChartExample_Previews: PreviewProvider {
    static var previews: some View {
        LineChartExample()
    }
}
