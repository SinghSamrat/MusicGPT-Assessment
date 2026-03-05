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
    @State var generatedItemsVM = GeneratedItemsListViewModel()
    
    @State var playerOffsetY: Double = Constants.MusicPlayerAnimation.playerInitialOffset
    @State var isAnimating: Bool = false
    
    @State private var isCreating: Bool = false
    @State private var promptText: String = ""

    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .main:
                ZStack {
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
                    .environment(generatedItemsVM)
                    
                    if isTextFieldFocused {
                        Color.black.opacity(0.001) // invisible but tappable
                            .ignoresSafeArea()
                            .onTapGesture {
                                isTextFieldFocused = false
                            }
                    }
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
        .onTapGesture {
            isTextFieldFocused = false
        }
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
                    .padding(.bottom, playerVM.currentTrack == nil ? 250 : 170)
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .focused($isTextFieldFocused)
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
        .overlay(alignment: .bottom) {
            if(isTextFieldFocused) {
                KeyboardGlowView(minBlurRadius: 40, maxBlurRadius: 80, maxOpacity: 0.7)
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .bottom)
                    .padding(.bottom, 50)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isTextFieldFocused)
    }
}


#Preview {
    MainTabView()
}
