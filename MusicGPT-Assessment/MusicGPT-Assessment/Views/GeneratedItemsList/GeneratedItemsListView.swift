//
//  AIGenerateScreenView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI

struct GeneratedItemsListView: View {
    @State var viewModel = GeneratedItemsListViewModel()
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
            
            CreateButtonView() {
                // create logic
            }
        }
        .padding(.leading)
    }
}


struct CreateButtonView: View {
    var createTapped: () -> Void
    
    var body: some View {
        Button {
            createTapped()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 103, height: 44)
                    .cornerRadius(100)
                    .foregroundColor(.white.opacity(0.1))
                
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
