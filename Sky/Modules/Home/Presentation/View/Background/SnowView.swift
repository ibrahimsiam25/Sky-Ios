//
//  SnowView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

enum SnowIntensity {
    case light, moderate, heavy
    
    var flakeCount: Int {
        switch self {
        case .light: return 20
        case .moderate: return 45
        case .heavy: return 80
        }
    }
    
    var speed: Double {
        switch self {
        case .light: return 4.5
        case .moderate: return 3.0
        case .heavy: return 2.0
        }
    }
}

struct SnowView: View {
    let intensity: SnowIntensity
    var isHail: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<intensity.flakeCount, id: \.self) { index in
                    SingleSnowFlake(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        speed: isHail ? 1.0 : intensity.speed,
                        isHail: isHail
                    )
                }
            }
        }
    }
}

struct SingleSnowFlake: View {
    let width: CGFloat
    let height: CGFloat
    let speed: Double
    let isHail: Bool
    
    @State private var startX: CGFloat = 0
    @State private var startY: CGFloat = 0
    @State private var driftOffset: CGFloat = 0
    
    var body: some View {
        Circle()
            .fill(isHail ? Color(white: 0.95) : Color.white)
            .frame(
                width: isHail ? CGFloat.random(in: 3...5) : CGFloat.random(in: 4...8),
                height: isHail ? CGFloat.random(in: 3...5) : CGFloat.random(in: 4...8)
            )
            .blur(radius: isHail ? 0 : 0.5)
            .position(x: startX + driftOffset, y: startY)
            .onAppear {
                startX = CGFloat.random(in: 10...width - 10)
                startY = CGFloat.random(in: -50...(-10))
                
                // Vertical falling movement
                withAnimation(
                    .linear(duration: Double.random(in: speed...speed + 1.5))
                    .repeatForever(autoreverses: false)
                ) {
                    startY = height + 20
                }
                
                // Horizontal swaying movement (for snow drift)
                if !isHail {
                    withAnimation(
                        .easeInOut(duration: Double.random(in: 1.5...3.0))
                        .repeatForever(autoreverses: true)
                    ) {
                        driftOffset = CGFloat.random(in: -25...25)
                    }
                }
            }
    }
}
