//
//  GeneratingItem.swift
//  MusicGPT-Assessment
//
//  Created by Samrat Singh on 05/03/2026.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
        )
    }
}

struct GeneratingItemImageRectangle: View {
    @State var rotation: Double = 0.0
    @State private var gradientOffset1: CGFloat = -100
    @State private var gradientOffset2: CGFloat = 100
    @State private var radius: CGFloat = 60
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 69, height: 69)
            
            LinearGradient(
                colors: [Color(hex: "AA00FF").opacity(0.3), Color(hex: "8962FF"), .black.opacity(0.5)],
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .frame(width: 80, height: 200)
            .rotationEffect(.degrees(25))
            .offset(x: gradientOffset1)
            .blur(radius: 20)
            .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true),value: gradientOffset1)
     
            LinearGradient(
                colors: [Color(hex: "FF6200"), Color(hex: "AA00FF").opacity(0.3), .black.opacity(0.5)],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
            .frame(width: 150, height: 200)
            .rotationEffect(.degrees(25))
            .offset(x: gradientOffset2)
            .blur(radius: 20)
            .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true),value: gradientOffset2)
            
            RadialGradient(
                colors: [Color(hex: "FF6200"), Color(hex: "AA00FF").opacity(0.5), .clear],
                center: .center,
                startRadius: 0,
                endRadius: radius
            )
            .blur(radius: 20)
            .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true),value: radius)
        }
        .frame(width: 69, height: 69)
        .cornerRadius(16)
        .blur(radius: 4)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    AngularGradient(
                        colors: [.orange, .purple, .black, .orange],
                        center: .center,
                        angle: .degrees(rotation)
                    ),
                    lineWidth: 1
                )
                .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: rotation)
        }
        .onAppear {
            rotation = 360
            gradientOffset1 = 100
            gradientOffset2 = -100
            radius = 0
        }
    }
}

#Preview {
    GeneratingItemImageRectangle()
}
