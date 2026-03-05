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
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(spacing: 6) {
                TitleView()
                Spacer()
            }
            .frame(height: 35)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.allItems, id: \.self) { item in
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
