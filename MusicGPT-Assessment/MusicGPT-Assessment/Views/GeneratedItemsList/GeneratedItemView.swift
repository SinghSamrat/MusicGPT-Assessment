//
//  GeneratedItemView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//


import SwiftUI

struct GeneratedItemView: View  {
    var generatedItem: GeneratedItem
    var itemTapped:() -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Image(generatedItem.artworkName)
                .foregroundColor(.white)
                .frame(width: 64, height: 64)
                .cornerRadius(16.0)
            
            VStack(alignment: .leading) {
                Text(generatedItem.title)
                    .font(.system(size: 16))
                Text(generatedItem.originalPrompt)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Button {
            } label: {
                Image(systemName: "ellipsis")
                    .tint(.secondary)
            }
        }
        .onTapGesture {
            itemTapped()
        }
    }
}

#Preview {
    GeneratedItemView(generatedItem: sampleGeneratedItem) {}
}
