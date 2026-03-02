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

struct MusicPlayer: View {
    @State var selectedTrack: GeneratedItem
    @State var isPlaying: Bool = true
    
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
                
                AudioControl(isPlaying: $isPlaying) { type in
                    switch type {
                    case .previous:
                        break
                    case .next:
                        break
                    }
                }
                    .padding(.trailing, 24)
            }
            .frame(height: 72)
            .padding(.leading, 8)
        }
        .padding(.horizontal)
        .border(.white.opacity(0.05), width: 1)
    }
}

struct AudioControl: View {
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

#Preview {
    MusicPlayer(selectedTrack: sampleGeneratedItem)
}
