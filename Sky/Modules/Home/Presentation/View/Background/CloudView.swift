//
//  CloudView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

struct CloudView: View {
    let cloudCount: Int
    let opacity: Double
    var isFog: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<cloudCount, id: \.self) { index in
                    SingleCloud(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        opacity: opacity,
                        isFog: isFog
                    )
                }
            }
        }
    }
}

struct SingleCloud: View {
    let width: CGFloat
    let height: CGFloat
    let opacity: Double
    let isFog: Bool
    
    @State private var startX: CGFloat = 0
    @State private var startY: CGFloat = 0
    
    var body: some View {
        Image(systemName: isFog ? "cloud.fog.fill" : "cloud.fill")
            .font(.system(size: isFog ? CGFloat.random(in: 160...280) : CGFloat.random(in: 110...220)))
            .foregroundStyle(LinearGradient(
                colors: [Color.white.opacity(opacity), Color.white.opacity(opacity * 0.4)],
                startPoint: .top,
                endPoint: .bottom
            ))
            .blur(radius: isFog ? 12 : 2)
            .position(x: startX, y: startY)
            .onAppear {

                startX = CGFloat.random(in: -200...width)
                
                if isFog {
                    startY = CGFloat.random(in: height * 0.65...height * 0.95)
                } else {
                    startY = CGFloat.random(in: 80...height * 0.45)
                }
                
                let duration = Double.random(in: isFog ? 45.0...90.0 : 25.0...55.0)
                
                withAnimation(
                    .linear(duration: duration)
                    .repeatForever(autoreverses: false)
                ) {
                    startX = width + 250
                }
            }
    }
}
