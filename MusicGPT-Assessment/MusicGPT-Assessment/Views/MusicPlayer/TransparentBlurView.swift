//
//  VisualEffectBlur.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 04/03/2026.
//

import SwiftUI


struct TransparentBlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            if let backdrop = uiView.layer.sublayers?.first {
                backdrop.filters?.removeAll { filter in
                    String(describing: filter) != "gaussianBlur"
                }
            }
        }
    }
}

#Preview {
    TransparentBlurView(style: .systemMaterialLight)
}
