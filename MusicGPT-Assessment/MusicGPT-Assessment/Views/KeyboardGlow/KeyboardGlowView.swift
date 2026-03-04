//
//  KeyboardGlowView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 04/03/2026.
//


import SwiftUI

struct KeyboardGlowView: View {
    @State var rotation: Double = 0.0
    @State var minBlurRadius: Double
    @State var opacity: Double = 0.0
    
    var maxBlurRadius: Double
    var maxOpacity: Double
    
    var body: some View {
        Rectangle()
            .fill(
                AngularGradient(
                    colors: [.purple, .orange, .purple],
                    center: .center,
                    angle: .degrees(rotation)
                )
            )
            .animation(
                .linear(duration: 4).repeatForever(autoreverses: false),
                value: rotation
            )
            .blur(radius: minBlurRadius)
            .animation(
                .linear(duration: 4).repeatForever(autoreverses: true),
                value: minBlurRadius
            )
            .opacity(opacity)
            .onAppear {
                rotation = 360
                minBlurRadius = maxBlurRadius
                opacity = maxOpacity
            }
            .animation(
                .linear(duration: 2),
                value: opacity
            )
            .allowsHitTesting(false)
    }
}
