//
//  ContinuedCourseSoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 3/30/21.
//

import SwiftUI
import AVKit

class ContinuedCourseSoundManager {
            
    static let instance = ContinuedCourseSoundManager() // Singleton
    
    var player: AVAudioPlayer?
    
    enum ContinuedCourseSoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: ContinuedCourseSoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct ContinuedCourseSoundsBootcamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                ContinuedCourseSoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound 2") {
                ContinuedCourseSoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

struct ContinuedCourseSoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseSoundsBootcamp()
    }
}
