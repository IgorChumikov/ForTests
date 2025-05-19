//
//  ZebraStripeRenderer.swift
//  ForTests
//
//  Created by Игорь Чумиков on 07.03.2025.
//

import SwiftUI

@available(iOS 18.0, *)
struct ContentView111: View {
 @State private var strength = 0.0

    @available(iOS 18.0, *)
    var body: some View {
     Text("Чумиков Игорь")
         .font(.largeTitle.weight(.black).width(.compressed))
         .textRenderer(QuakeRenderer(moveAmount: strength))
         .onAppear {
             withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                 strength = 10
             }
         }
 }
}

@available(iOS 18.0, *)
#Preview {

        ContentView111()
 
}

@available(iOS 17.0, *)
struct WaveRenderer: TextRenderer {
    var strength: Double
    var frequency: Double

    var animatableData: Double {
        get { strength }
        set { strength = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for (index, glyph) in run.enumerated() {
                    let yOffset = strength * sin(Double(index) * frequency)
                    var copy = context

                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}


@available(iOS 17.0, *)
struct QuakeRenderer: TextRenderer {
 var moveAmount: Double

 var animatableData: Double {
     get { moveAmount }
     set { moveAmount = newValue }
 }

 func draw(layout: Text.Layout, in context: inout GraphicsContext) {
     for line in layout {
         for run in line {
             for glyph in run {
                 var copy = context
                 let yOffset = Double.random(in: -moveAmount...moveAmount)

                 copy.translateBy(x: 0, y: yOffset)
                 copy.draw(glyph, options: .disablesSubpixelQuantization)
             }
         }
     }
 }
}


