//
//  MusicGPT_AssessmentApp.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 01/03/2026.
//

import SwiftUI

@main
struct MusicGPT_AssessmentApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .environment(\.colorScheme, .dark)
    }
}
