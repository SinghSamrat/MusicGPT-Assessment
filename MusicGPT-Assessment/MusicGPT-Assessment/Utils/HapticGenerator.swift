//
//  HapticGenerator.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 06/03/2026.
//

import SwiftUI

func addImpactHaptic(_ type: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: type)
    generator.prepare()
    generator.impactOccurred()
}
