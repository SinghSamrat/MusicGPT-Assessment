//
//  FloatingTextField.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 04/03/2026.
//


import SwiftUI

struct FloatingTextField: View {
    var placeholder: String
    @Binding var text: String
    @Binding var isCreating: Bool
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text("+")
                    .font(.system(size: 28, weight: .light))
                    .foregroundColor(.white.opacity(0.3))
                TextField("\(placeholder)", text: $text)
                    .focused($isFocused)
                    .font(.system(size: 16))
                Button {
                    print("button pressed")
                    isFocused = false // Dismiss keyboard
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundColor(text.isEmpty ? .gray : .white)
                }
                .disabled(text.isEmpty)
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(
            ZStack {
                TransparentBlurView(style: .prominent)
                    .cornerRadius(35)
                    .zIndex(1)
                
                RoundedRectangle(cornerRadius: 35)
                    .fill(.createFieldBG)
                    .stroke(isFocused ? Color.blue : Color.gray.opacity(0.3))
            }
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isFocused = true
            }
        }
        .onChange(of: isFocused) { _, newValue in
            if !newValue {
                isCreating = false
            }
        }
    }
}