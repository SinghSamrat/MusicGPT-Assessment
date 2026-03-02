//
//  CustomTabView.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 01/03/2026.
//

import SwiftUI

enum TabItem: CaseIterable, Identifiable {
    case main
    case explore
    case library
    case profile
    
    var id: Self {
        self
    }
    
    var icon: String {
        switch self {
        case .main:
            "generate-ai-icon"
        case .explore:
            "discover-icon"
        case .library:
            "user-icon"
        case .profile:
            "reel-icon"
        }
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack(spacing: 63) {
            ForEach(TabItem.allCases) { tabItem in
                CustomTabItem(tabItem: tabItem) {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        selectedTab = tabItem
                    }
                }
                .tag(tabItem)
                .foregroundColor(selectedTab == tabItem ? .white : .secondary)
            }
        }
        .frame(maxHeight: 85)
        .padding(.horizontal, 56)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 1)
        }
    }
}

struct CustomTabItem: View {
    var tabItem: TabItem
    var pressed: () -> Void
    
    var body: some View {
        Image(tabItem.icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25)
            .onTapGesture {
                pressed()
            }
    }
}

#Preview {
    CustomTabView(selectedTab: .constant(.main))
}
