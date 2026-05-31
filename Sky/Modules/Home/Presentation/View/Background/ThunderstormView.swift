//
//  ThunderstormView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI
import Combine

struct ThunderstormView: View {
    @State private var flashOpacity: Double = 0.0
    
    // Timer to trigger lightning flashes every 5 seconds
    private let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Dark clouds
            CloudView(cloudCount: 6, opacity: 0.4)
            
            // Heavy rain
            RainView(intensity: .heavy)
            
            // Lightning flash overlay
            Color.white
                .opacity(flashOpacity)
                .ignoresSafeArea()
        }
        .onReceive(timer) { _ in
            triggerLightningStrike()
        }
    }
    
    private func triggerLightningStrike() {
        // Strike 1
        withAnimation(.easeIn(duration: 0.1)) {
            flashOpacity = 0.6
        }
        
        // Decay 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeOut(duration: 0.15)) {
                flashOpacity = 0.0
            }
        }
        
        // Double Strike 2
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeIn(duration: 0.05)) {
                flashOpacity = 0.75
            }
            
            // Decay 2
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.easeOut(duration: 0.35)) {
                    flashOpacity = 0.0
                }
            }
        }
    }
}
