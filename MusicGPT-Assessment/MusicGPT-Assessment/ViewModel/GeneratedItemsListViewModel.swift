//
//  GeneratedItemViewModel.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 02/03/2026.
//

import SwiftUI

@Observable
class GeneratedItemsListViewModel {
    var allItems: [GeneratedItem] = sampleGeneratedItems
    var isGenerating: Bool = false
    var generatingItem: GeneratingItem?
    
    func addItem(_ item: GeneratedItem) {
        allItems.append(item)
    }
}
