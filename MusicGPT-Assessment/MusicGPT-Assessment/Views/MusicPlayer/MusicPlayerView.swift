//
//  MusicPlayer.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI

enum AudioControlButtonType {
    case previous
    case next
}

struct MusicPlayerView: View {
    var selectedTrack: GeneratedItem
    @Binding var isPlaying: Bool
    
    var trackChanged: (AudioControlButtonType) -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 72)
                .cornerRadius(20)
                .foregroundColor(.musicPlayerBG)
            
            HStack(spacing: 12) {
                Image(selectedTrack.artworkName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 56, height: 56)
                    .cornerRadius(12)
                
                Text(selectedTrack.title)
                    .font(.system(size: 16, weight: .medium))
                
                Spacer()
                
                AudioControlView(isPlaying: $isPlaying) { type in
                    trackChanged(type)
                }
                    .padding(.trailing, 24)
            }
            .frame(height: 72)
            .padding(.leading, 8)
        }
        .border(.white.opacity(0.05), width: 1)
    }
}

#Preview {
    MusicPlayerView(selectedTrack: sampleGeneratedItem, isPlaying: .constant(true)) {control in }
}
