//
//  MusicGpt.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 01/03/2026.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabItem = .main
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .main:
                GeneratedItemsListView()
            case .explore:
                EmptyView()
            case .library:
                EmptyView()
            case .profile:
                EmptyView()
            }
            Spacer()
            CustomTabView(selectedTab: $selectedTab)
        }
        .padding(.vertical)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainTabView()
}
