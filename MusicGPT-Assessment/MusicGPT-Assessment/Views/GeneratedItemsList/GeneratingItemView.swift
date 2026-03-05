//
//  GeneratingItemView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 05/03/2026.
//

import SwiftUI


struct GeneratingItemView: View  {
    var prompt: String
    var version: Int
    var artworkName: String
    var generationCompleted:() -> Void
    
    @State private var progress: Double = 0.0
    @State private var isGenerating = true
    @State var generationState: GenerationState = .parsingPrompt
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                Rectangle()
                    .fill(.createFieldBG)
                    .offset(x: 16) // since corner radius is 0, x offset is added so that its not visible behind GeneratingItemImageRectangle
                    .frame(width: geo.size.width * progress)
                    .animation(.easeInOut(duration: 0.2), value: progress)
            }
            .frame(height: 69)
            
            HStack(spacing: 12) {
                ZStack {
                    Image(artworkName)
                        .foregroundColor(.white)
                        .frame(width: 69, height: 69)
                        .cornerRadius(16.0)
                    
                    GeneratingItemImageRectangle()
                        .opacity(1.7 - progress)
                    
                    Text("\(Int(progress * 100))%")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.5))
                }
                
                VStack(alignment: .leading) {
                    Text(prompt)
                        .font(.system(size: 16))
                        .lineLimit(1)
                    
                    Text(generationState.title)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Text("v\(version)")
                    .font(.system(size: 14, weight: .medium))
                    .frame(width: 39, height: 26)
                    .background() {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.createFieldBG)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
        }
        .onAppear {
            simulateProgress()
        }
        .onChange(of: isGenerating) { _, newValue in
            if (!newValue) {
                generationCompleted()
                // generation finished, replace with new item
            }
        }
    }
}

extension GeneratingItemView {
    func simulateProgress() {
        Task {
            while progress < 1.0 {
                try? await Task.sleep(nanoseconds: UInt64.random(in: 2_000_000_000...4_000_000_000))
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    progress += 0.25
                    if (progress <= 0.25) {
                        generationState = .parsingPrompt
                    } else if (progress <= 0.5) {
                        generationState = .startingAudioEngine
                    } else if (progress <= 0.75) {
                        generationState = .preparingAudio
                    } else {
                        generationState = .almostDone
                    }
                }
                if progress >= 1.0 {
                    progress = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isGenerating = false
                    }
                    break
                }
            }
        }
    }
}

#Preview {
    GeneratingItemView(prompt: "", version: 1, artworkName: "monday-blues", generationCompleted: {})
}
