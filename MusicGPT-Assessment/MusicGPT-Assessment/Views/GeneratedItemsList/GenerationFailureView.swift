//
//  GenerationFailureView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 05/03/2026.
//

import SwiftUI

struct GenerationFailureView: View {
    var prompt: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 64)
            
            VStack(alignment: .leading) {
                Text("Invalid Prompt")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(prompt)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                Text("Your prompt is too short.")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.white)
                    .padding(.top, 0.5)
            }
            
            Spacer()
        }
    }
}

#Preview {
    GenerationFailureView(prompt: "haha")
}
