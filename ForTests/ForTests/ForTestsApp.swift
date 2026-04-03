//
//  ForTestsApp.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

@main
struct ForTestsApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 26.0, *) {
                Canvas_Intro()
            } else {
                ScreenshotListenerView()
            }
        }
    }
}
