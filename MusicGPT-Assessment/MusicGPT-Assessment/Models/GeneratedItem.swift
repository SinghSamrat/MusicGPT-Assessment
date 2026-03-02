//
//  GeneratedItemModel.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI

struct GeneratedItem: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var originalPrompt: String
    var audioFileName: String
    var artworkName: String
    var createdAt: Date = Date()
}

let sampleGeneratedItem: GeneratedItem = .init(title: "Happy Birthday",
                                               originalPrompt: "Generate a cheerful birthday song for a 10 year old.",
                                               audioFileName: "",
                                               artworkName: "cosmic-energies")


let sampleGeneratedItems: [GeneratedItem] = [
    .init(title: "Happy Birthday",
          originalPrompt: "Generate a cheerful birthday song for a 10 year old.",
          audioFileName: "",
          artworkName: "monday-blues"),
    
    .init(title: "Cosmic Energies",
          originalPrompt: "Create a whimsical and cosmic-themed devotional song.",
          audioFileName: "",
          artworkName: "cosmic-energies"),
    
    .init(title: "Mero Nepal",
          originalPrompt: "Generate a patriotic song celebrating Nepal and its people.",
          audioFileName: "",
          artworkName: "peace-at-paradise"),
    
    .init(title: "Enemy",
          originalPrompt: "A sad song about a lost love.",
          audioFileName: "",
          artworkName: "sands-of-time"),
]
