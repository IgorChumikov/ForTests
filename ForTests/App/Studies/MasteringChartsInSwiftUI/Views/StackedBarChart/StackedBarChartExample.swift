//
//  StackedBarChartExample.swift
//  MasteringChartsInSwiftUI4
//
//  Created by Игорь Чумиков on 21.07.2025.
//

import Charts
import SwiftUI

struct StackedBarChartExample: View {
    var body: some View {
        VStack {
            Text("DevTechie.com")
                .font(.largeTitle)
                .foregroundColor(.primary)
            
            Text("Number of students by course category.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Chart(DevTechieCourse.data) { course in
                BarMark(
                    x: .value("Students", course.students),
                    y: .value("Source", course.source.rawValue)
                )
                .foregroundStyle(by: .value("Category", course.category.rawValue))
                .annotation(position: .overlay) {
                    Text(course.students.formatted())
                        .font(.caption2.bold())
                }
            }
            .frame(height: 300)
        }
        .padding()
    }
}

struct StackedBarChartExample_Previews: PreviewProvider {
    static var previews: some View {
        StackedBarChartExample()
    }
}
