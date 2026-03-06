//
//  FloatingTextField.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 04/03/2026.
//


import SwiftUI

struct FloatingTextField: View {
    var placeholder: String
    @State var text: String = ""
    @FocusState var isFocused: Bool
    
    @State private var rotation: Double = 0
    @State private var blurRadius: Double = 5
    
    var promptSubmitted: (String) -> Void
    var focusOut: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .fill(AngularGradient(colors: [.purple, .orange, .purple],
                                      center: .center,
                                      angle: .degrees(rotation)))
                .frame(height: 50)
                .blur(radius: blurRadius)
                .onAppear {
                    rotation = 360
                    blurRadius = 20
                }
           
            ZStack {
                TransparentBlurView(style: .systemMaterialDark)
                    .cornerRadius(35)
                
                Rectangle()
                    .fill(.createFieldBG.opacity(1.0))
                    .cornerRadius(35)
            }
            .frame(height: 50)
            
            HStack {
                Text("+")
                    .font(.system(size: 28, weight: .light))
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.leading, 21)
                TextField("\(placeholder)", text: $text)
                    .focused($isFocused)
                    .font(.system(size: 16))
                Button {
                    isFocused = false // Dismiss keyboard
                    promptSubmitted(text)
                    addImpactHaptic(.medium)
                    text = ""
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundColor(text.isEmpty ? .gray : .white)
                        .padding(.trailing, 9)
                }
                .buttonStyle(SpringButtonStyle())
                .disabled(text.isEmpty)
            }
            .frame(height: 50)
            .cornerRadius(35)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 35)
                .stroke(.angularGradient(colors: [.orange, .purple, .orange],
                                         center: .center,
                                         startAngle: .degrees(360 - rotation),
                                         endAngle: .degrees(rotation)),
                        lineWidth: 1)
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isFocused = true
            }
        }
        .animation(
            .linear(duration: 4).repeatForever(autoreverses: true),
            value: blurRadius
        )
        .animation(
            .linear(duration: 4).repeatForever(autoreverses: false),
            value: rotation
        )
        .onChange(of: isFocused) { _, isFocused in
            if !isFocused {
                focusOut()
            }
        }
    }
}

struct SpringButtonStyle: ButtonStyle {
    var scaleAmount: CGFloat = 0.85
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1)
            .animation(
                .spring(response: 0.3, dampingFraction: 0.5),
                value: configuration.isPressed
            )
    }
}

#Preview {
    FloatingTextField(placeholder: "", text: "") { String in
        
    } focusOut: {
        
    }

//    Button {
//        print("button pressed")
//    } label: {
//        Image(systemName: "arrow.up.circle.fill")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 100)
//            .foregroundColor( .white)
//            .padding(.trailing, 9)
//    }
//    .buttonStyle(SpringButtonStyle())
}
