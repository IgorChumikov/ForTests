//
//  ContinuedCourseHapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 3/30/21.
//

import SwiftUI

class ContinuedCourseHapticManager {
    
    static let instance = ContinuedCourseHapticManager() // Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}

struct ContinuedCourseHapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Button("success") { ContinuedCourseHapticManager.instance.notification(type: .success) }
            Button("warning") { ContinuedCourseHapticManager.instance.notification(type: .warning) }
            Button("error") { ContinuedCourseHapticManager.instance.notification(type: .error) }
            Divider()
            Button("soft") { ContinuedCourseHapticManager.instance.impact(style: .soft) }
            Button("light") { ContinuedCourseHapticManager.instance.impact(style: .light) }
            Button("medium") { ContinuedCourseHapticManager.instance.impact(style: .medium) }
            Button("rigid") { ContinuedCourseHapticManager.instance.impact(style: .rigid) }
            Button("heavy") { ContinuedCourseHapticManager.instance.impact(style: .heavy) }
        }
    }
}

struct ContinuedCourseHapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseHapticsBootcamp()
    }
}
