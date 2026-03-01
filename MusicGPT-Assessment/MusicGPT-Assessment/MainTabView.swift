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
            Spacer()
            CustomTabView(selectedTab: $selectedTab)
        }
        .padding(.bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
