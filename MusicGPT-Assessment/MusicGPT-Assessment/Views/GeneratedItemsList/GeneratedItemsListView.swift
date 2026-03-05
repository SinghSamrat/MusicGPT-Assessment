//
//  AIGenerateScreenView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI

struct GeneratedItemsListView: View {
    let maxGenerations: Int = 2
    
    @Environment(GeneratedItemsListViewModel.self) private var viewModel
    var trackChanged: (GeneratedItem) -> Void
    
    @State private var generationCount: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(spacing: 6) {
                TitleView()
                Spacer()
            }
            .frame(height: 35)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if viewModel.isGenerating {
                        GeneratingItemView(prompt: viewModel.generatingItem?.originalPrompt ?? "",
                                           version: 1,
                                           generationCompleted: {
                            generationCount += 1
                            onGenerationCompleted()
                            
                        })
                        GeneratingItemView(prompt: viewModel.generatingItem?.originalPrompt ?? "",
                                           version: 2,
                                           generationCompleted: {
                            generationCount += 1
                            onGenerationCompleted()
                        })
                    }
                    ForEach(viewModel.allItems.sorted { $0.createdAt > $1.createdAt }, id: \.self) { item in
                        GeneratedItemView(generatedItem: item) {
                            trackChanged(item)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func onGenerationCompleted() -> Void {
        if (generationCount == maxGenerations) {
            generationCount = 0
            let newItems: [GeneratedItem] = [
                GeneratedItem.init(title: "New Item 1",
                                   originalPrompt: viewModel.generatingItem?.originalPrompt ?? "",
                                   audioFileName: "",
                                   artworkName: viewModel.generatingItem?.artworkName ?? ""),
                GeneratedItem.init(title: "New Item 1",
                                   originalPrompt: viewModel.generatingItem?.originalPrompt ?? "",
                                   audioFileName: "",
                                   artworkName: viewModel.generatingItem?.artworkName ?? "")
            ]
            withAnimation {
                viewModel.isGenerating = false
                viewModel.allItems.append(contentsOf: newItems)
                
            }
        }
    }
}

struct TitleView: View {
    var body: some View {
        Image("Subtract")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("MusicGPT")
            .font(.system(size: 18))
            .fontWeight(.medium)
    }
}


#Preview {
    GeneratedItemsListView() { GeneratedItem in
        
    }
}
