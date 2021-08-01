//
//  PlaySound.swift
//  Honeylove
//
//  Created by Daval Cato on 8/1/21.
//

import AVFoundation
// Function to play sound
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(
        forResource: sound,
        ofType: type) {
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}















