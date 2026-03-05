//
//  GeneratingItem.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 05/03/2026.
//

import SwiftUI

enum GenerationState: Int, CaseIterable {
    case parsingPrompt
    case startingAudioEngine
    case preparingAudio
    case almostDone
    case completed
    case failure
    
    var title: String {
        switch self {
        case .parsingPrompt:
            return "Parsing Prompt"
        case .startingAudioEngine:
            return "Starting Audio Engine"
        case .preparingAudio:
            return "Preparing Your Audio"
        case .almostDone:
            return "Almost Done."
        case .completed:
            return "Completed"
        case .failure:
            return "Failure"
        }
    }
}

struct GeneratingItem: Identifiable, Hashable {
    let id: UUID = UUID()
    var originalPrompt: String
    var artworkName: String
    var didFail: Bool = false
}
