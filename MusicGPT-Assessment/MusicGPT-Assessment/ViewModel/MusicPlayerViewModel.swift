//
//  MusicPlayerViewModel.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 03/03/2026.
//

import SwiftUI

@Observable
final class MusicPlayerViewModel {
    var currentTrack: GeneratedItem?
    var isPlaying: Bool = false
    
    func play(_ track: GeneratedItem) {
        currentTrack = track
        isPlaying = true
    }
    
    func pause() {
        isPlaying = false
    }
}
