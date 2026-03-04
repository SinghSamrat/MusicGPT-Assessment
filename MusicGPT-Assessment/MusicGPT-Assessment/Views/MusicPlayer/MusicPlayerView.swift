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
    
    @Binding var offsetY: Double
    
    var trackChanged: (AudioControlButtonType) -> Void
    var trackClosed: () -> Void
    var playerDisappeared: () -> Void
    
    var body: some View {
        ZStack {
            ZStack {
                TransparentBlurView(style: .systemThickMaterial)
                
                Rectangle()
                    .border(.white.opacity(0.05), width: 1)
                    .foregroundColor(.musicPlayerBG)
            }
            .frame(height: 72)
            .cornerRadius(20)
            
            
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
        .frame(width: 386)
        .offset(y: offsetY)
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                offsetY = 0
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    handleDragChanged(value)
                })
                .onEnded({ value in
                    handleDragEnded(value)
                })
        )
        .onDisappear {
            playerDisappeared()
        }
    }
}

extension MusicPlayerView {
    private func handleDragChanged(_ value: DragGesture.Value) {
        guard value.translation.height > 0 else { return }
        offsetY = value.translation.height
    }

    private func handleDragEnded(_ value: DragGesture.Value) {
        let translation = value.translation.height
        let velocity = value.velocity.height

        if (translation > 80 || velocity > 300) {
            dismissPlayer()
        } else {
            resetPosition()
        }
    }

    private func dismissPlayer() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            offsetY = Constants.MusicPlayerAnimation.playerMaxOffsetY
            trackClosed()
        }
    }

    private func resetPosition() {
        withAnimation(.easeInOut(duration: 0.6)) {
            offsetY = 0
        }
    }
}

#Preview {
    MusicPlayerView(selectedTrack: sampleGeneratedItem, isPlaying: .constant(true), offsetY: .constant(120)) {control in } trackClosed: {} playerDisappeared: {}
}
