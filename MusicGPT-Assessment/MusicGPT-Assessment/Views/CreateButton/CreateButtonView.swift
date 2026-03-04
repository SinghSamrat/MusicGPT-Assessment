//
//  CreateButtonView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 04/03/2026.
//


import SwiftUI

struct CreateButtonView: View {
    var createTapped: () -> Void
    
    var body: some View {
        Button {
            createTapped()
        } label: {
            ZStack {
                ZStack {
                    TransparentBlurView(style: .systemMaterialDark)
                    
                    Rectangle()
                        .foregroundColor(.white.opacity(0.1))
                }
                .frame(width: 103, height: 44)
                .cornerRadius(100)
                
                HStack(spacing: 4) {
                    Image("stars")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text("Create")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    CreateButtonView() {}
}
