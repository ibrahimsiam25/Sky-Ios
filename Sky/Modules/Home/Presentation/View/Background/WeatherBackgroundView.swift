//
//  WeatherBackgroundView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

struct WeatherBackgroundView: View {
    let animation: WeatherAnimationType
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: animation.backgroundColors,
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Render specific simple animations
            switch animation {
            case .sunny:
                SunView(isNight: false)
            case .clearNight:
                SunView(isNight: true)
            case .partlyCloudy:
                CloudView(cloudCount: 3, opacity: 0.4)
            case .cloudy:
                CloudView(cloudCount: 6, opacity: 0.6)
            case .lightRain:
                RainView(intensity: .light)
            case .rain:
                RainView(intensity: .moderate)
            case .heavyRain:
                RainView(intensity: .heavy)
            case .thunderstorm:
                ThunderstormView()
            case .snow:
                SnowView(intensity: .light)
            case .blizzard:
                SnowView(intensity: .heavy)
            case .fog:
                CloudView(cloudCount: 5, opacity: 0.3, isFog: true)
            case .hail:
                SnowView(intensity: .moderate, isHail: true)
            }
        }
    }
}
