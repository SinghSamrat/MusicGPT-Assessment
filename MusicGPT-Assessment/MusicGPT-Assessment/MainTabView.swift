//
//  MusicGpt.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 01/03/2026.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabItem = .main
    @State var playerVM = MusicPlayerViewModel()
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .main:
                GeneratedItemsListView() { item in
                    playerVM.currentTrack = item
                }
            case .explore:
                EmptyView()
            case .library:
                EmptyView()
            case .profile:
                EmptyView()
            }
            Spacer()
            
            if let currentTrack = playerVM.currentTrack {
                MusicPlayerView(selectedTrack: currentTrack,
                                isPlaying: $playerVM.isPlaying) { controlType in
                    switch controlType {
                    case .next:
                        break
                    case .previous:
                        break
                    }
                }
                    .padding(.horizontal, 8)
            }
            CustomTabView(selectedTab: $selectedTab)
        }
        .padding(.vertical)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainTabView()
}
