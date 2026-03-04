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
    
    @State var playerOffsetY: Double = Constants.MusicPlayerAnimation.playerInitialOffset
    @State var isAnimating: Bool = false
    
    @State private var isCreating: Bool = false
    @State private var promptText: String = ""
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .main:
                VStack {
                    GeneratedItemsListView() { item in
                        if !isAnimating {
                            playerVM.isPlaying = true
                            if (playerVM.currentTrack == nil) { // spring anim only if player currently hidden
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                                    playerVM.currentTrack = item
                                }
                            } else {
                                playerVM.currentTrack = item
                            }
                        }
                    }
                    .padding(.vertical)
                }
            case .explore:
                EmptyView()
            case .library:
                EmptyView()
            case .profile:
                EmptyView()
            }
            
            Spacer()
        }
        .overlay(alignment: .bottom) {
            BottomOverlayView()
                .padding(.bottom, 10)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

extension MainTabView {
    func BottomOverlayView() -> some View{
        return VStack{
            if (selectedTab == .main) {
                if !isCreating {
                    CreateButtonView() {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isCreating = true
                        }
                    }
                    .offset(y: (playerOffsetY <= Constants.MusicPlayerAnimation.playerMaxOffsetY - 5) ? playerOffsetY / 2 : 0)
                }
            }
            
            if isCreating {
                FloatingTextField(placeholder: "Create Song", text: $promptText, isCreating: $isCreating)
                    .padding(.bottom, 250)
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            
            if let currentTrack = playerVM.currentTrack {
                MusicPlayerView(selectedTrack: currentTrack,
                                isPlaying: $playerVM.isPlaying,
                                offsetY: $playerOffsetY) { controlType in
                    switch controlType {
                    case .next:
                        break
                    case .previous:
                        break
                    }
                } trackClosed: {
                    isAnimating = true
                    playerVM.currentTrack = nil
                } playerDisappeared: {
                    isAnimating = false
                }
                .padding(.horizontal, 8)
                .zIndex(1)
            }
            
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
