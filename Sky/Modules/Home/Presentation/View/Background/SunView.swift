//
//  SunView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

struct SunView: View {
    let isNight: Bool
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isNight {
                    // Starry night field
                    ForEach(0..<25, id: \.self) { index in
                        StarView(
                            x: CGFloat.random(in: 20...geometry.size.width - 20),
                            y: CGFloat.random(in: 20...geometry.size.height / 2.5)
                        )
                    }
                    
                    // Moon view with glow
                    Image(systemName: "moon.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(LinearGradient(
                            colors: [.white, Color(red: 0.9, green: 0.9, blue: 0.95)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .shadow(color: .white.opacity(0.5), radius: 15)
                        .scaleEffect(isAnimating ? 1.03 : 0.97)
                        .position(x: geometry.size.width - 80, y: 120)
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 4.0)
                                .repeatForever(autoreverses: true)
                            ) {
                                isAnimating = true
                            }
                        }
                    
                } else {
                    // Glowing Sun view
                    ZStack {
                        // Halo glow
                        Circle()
                            .fill(Color.yellow.opacity(0.15))
                            .frame(width: 160, height: 160)
                            .scaleEffect(isAnimating ? 1.15 : 0.95)
                            .blur(radius: 10)
                        
                        Circle()
                            .fill(Color.yellow.opacity(0.3))
                            .frame(width: 120, height: 120)
                            .scaleEffect(isAnimating ? 1.08 : 0.98)
                            .blur(radius: 5)
                        
                        // Sun core
                        Circle()
                            .fill(LinearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 80, height: 80)
                            .shadow(color: .orange.opacity(0.5), radius: 10)
                    }
                    .position(x: geometry.size.width - 80, y: 120)
                    .onAppear {
                        withAnimation(
                            .easeInOut(duration: 3.0)
                            .repeatForever(autoreverses: true)
                        ) {
                            isAnimating = true
                        }
                    }
                }
            }
        }
    }
}

struct StarView: View {
    let x: CGFloat
    let y: CGFloat
    @State private var opacity = Double.random(in: 0.1...0.8)
    
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: CGFloat.random(in: 1.5...3.0), height: CGFloat.random(in: 1.5...3.0))
            .position(x: x, y: y)
            .opacity(opacity)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 2.0...4.0))
                    .repeatForever(autoreverses: true)
                ) {
                    opacity = Double.random(in: 0.8...1.0)
                }
            }
    }
}
