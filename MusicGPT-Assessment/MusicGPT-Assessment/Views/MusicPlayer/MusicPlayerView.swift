//
//  MusicPlayer.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI


struct MusicPlayerView: View {
    var selectedTrack: GeneratedItem
    @Binding var isPlaying: Bool
    
    @State var offsetY: Double = 170.0
    
    var trackChanged: (AudioControlButtonType) -> Void
    var trackClosed: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 72)
                .border(.white.opacity(0.05), width: 1)
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
        .offset(y: offsetY)
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                offsetY = 0
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    if (value.translation.height > 0) {
                        offsetY = value.translation.height
                    }
                })
                .onEnded({ value in
                    let translation = value.translation.height
                    let velocity = value.velocity.height
                    
                    if translation > 80 || velocity > 300 {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            offsetY = 150
                            trackClosed()
                        }
                    } else {
                        withAnimation(.easeInOut(duration: 0.6)) {
                            offsetY = 0
                        }
                    }
                })
        )
    }
}

#Preview {
    MusicPlayerView(selectedTrack: sampleGeneratedItem, isPlaying: .constant(true)) {control in } trackClosed: {}
}
