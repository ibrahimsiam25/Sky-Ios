//
//  RainView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

enum RainIntensity {
    case light, moderate, heavy
    
    var dropCount: Int {
        switch self {
        case .light: return 25
        case .moderate: return 50
        case .heavy: return 90
        }
    }
    
    var speed: Double {
        switch self {
        case .light: return 1.4
        case .moderate: return 1.0
        case .heavy: return 0.7
        }
    }
}

struct RainView: View {
    let intensity: RainIntensity
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<intensity.dropCount, id: \.self) { index in
                    SingleRainDrop(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        speed: intensity.speed
                    )
                }
            }
        }
    }
}

struct SingleRainDrop: View {
    let width: CGFloat
    let height: CGFloat
    let speed: Double
    
    @State private var startX: CGFloat = 0
    @State private var startY: CGFloat = 0
    
    var body: some View {
        Capsule()
            .fill(LinearGradient(
                colors: [.blue.opacity(0.1), .white.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            ))
            .frame(width: 1.5, height: CGFloat.random(in: 15...30))
            .position(x: startX, y: startY)
            .onAppear {
                startX = CGFloat.random(in: 10...width - 10)
                startY = CGFloat.random(in: -100...(-10))
                
                withAnimation(
                    .linear(duration: Double.random(in: speed...speed + 0.4))
                    .repeatForever(autoreverses: false)
                ) {
                    startY = height + 50
                }
            }
    }
}
