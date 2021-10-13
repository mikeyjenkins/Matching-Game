//
//  FlipAudio.swift
//  Concentration
//
//  Created by Michael Jenkins on 10/13/21.
//

import Foundation
import AVFoundation

struct SoundPlayer {
    var player: AVAudioPlayer?


    mutating func playSound(name soundName: String){
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else {
            return
        }
        
        do{
            if (UserDefaults.standard.bool(forKey: Settings.flipSound) == true){
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.play()
            }
        } catch{
            print("error")
        }
        
    }
}
