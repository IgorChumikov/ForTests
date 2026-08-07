//
//  ContinuedCourseMultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 3/27/21.
//

import SwiftUI

struct ContinuedCourseRandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct ContinuedCourseMultipleSheetsBootcamp: View {
    
    @State var selectedModel: ContinuedCourseRandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = ContinuedCourseRandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                ContinuedCourseNextScreen(selectedModel: model)
            }
        }
    }
}

struct ContinuedCourseNextScreen: View {
    
    let selectedModel: ContinuedCourseRandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct ContinuedCourseMultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseMultipleSheetsBootcamp()
    }
}
