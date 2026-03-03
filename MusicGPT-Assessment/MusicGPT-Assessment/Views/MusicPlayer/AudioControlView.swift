//
//  AudioControl.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 03/03/2026.
//


import SwiftUI

struct AudioControlView: View {
    @Binding var isPlaying: Bool
    var audioControlPressed: (AudioControlButtonType) -> Void
    
    var body: some View {
        HStack(spacing: 22) {
            Button { audioControlPressed(.previous) } label: {
                PreviousTrackView()
            }
            
            Button {
                withAnimation(.easeInOut(duration: 0.01)) {
                    isPlaying.toggle()
                }
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .resizable()
            }
            .frame(width: 17, height: 20)
            
            Button { audioControlPressed(.previous) } label: {
                NextTrackView()
            }
        }
        .tint(.white)
    }
}

struct PreviousTrackView: View {
    var body: some View {
        HStack(spacing: 1.0) {
            Rectangle()
                .frame(width: 4, height: 15)
                .cornerRadius(4)
            Image(systemName: "play.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
                .rotationEffect(.degrees(180))
        }
    }
}

struct NextTrackView: View {
    var body: some View {
        HStack(spacing: 1.0) {
            Image(systemName: "play.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
            Rectangle()
                .frame(width: 4, height: 15)
                .cornerRadius(4)
        }
    }
}
