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
    @State var isGenerationFailed: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(spacing: 6) {
                TitleView()
                Spacer()
            }
            .frame(height: 35)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.generatingItems) { item in // for each generating item
                        if (item.didFail) {
                            GenerationFailureView(prompt: item.originalPrompt)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                        withAnimation {
                                            viewModel.generatingItems.removeAll { $0.id == item.id }
                                        }
                                    }
                                }
                        } else {
                            GeneratingItemView(prompt: item.originalPrompt, version: 1, artworkName: "monday-blues") { success in
                                generationCount += 1
                                if (generationCount == 2) {
                                    generationCount = 0
                                    onGenerationCompleted(success, item)
                                }
                            }
                            
                            GeneratingItemView(prompt: item.originalPrompt, version: 2, artworkName: "monday-blues") { success in
                                generationCount += 1
                                if (generationCount == 2) {
                                    generationCount = 0
                                    onGenerationCompleted(success, item)
                                }
                            }
                        }
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
    
    func onGenerationCompleted(_ success: Bool, _ item: GeneratingItem) -> Void {
        if (!success) {
            if let index = viewModel.generatingItems.firstIndex(where: { $0.id == item.id }) {
                viewModel.generatingItems[index].didFail = true
            }
            return
        }
        
        viewModel.generatingItems = viewModel.generatingItems.filter() {$0.id != item.id}
        
        let newItems: [GeneratedItem] = [
            GeneratedItem.init(title: "New Item 1",
                               originalPrompt: item.originalPrompt,
                               audioFileName: "",
                               artworkName: item.artworkName),
            
            GeneratedItem.init(title: "New Item 2",
                               originalPrompt: item.originalPrompt,
                               audioFileName: "",
                               artworkName: item.artworkName)
        ]
        
        withAnimation {
            viewModel.allItems.append(contentsOf: newItems)
        }
    }
}

struct TitleView: View {
    var body: some View {
        Image("Subtract")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("MusicGPT")
            .foregroundColor(.white)
            .font(.system(size: 18))
            .fontWeight(.medium)
    }
}


#Preview {
    GeneratedItemsListView() { GeneratedItem in
        
    }
}
