//
//  WeatherAnimationSystem.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

extension Color {
    static let skySunnyStart = Color(red: 0.25, green: 0.6, blue: 0.9)
    static let skySunnyEnd = Color(red: 0.5, green: 0.8, blue: 0.95)
    
    static let skyNightStart = Color(red: 0.03, green: 0.05, blue: 0.15)
    static let skyNightEnd = Color(red: 0.1, green: 0.15, blue: 0.3)
    
    static let skyCloudyStart = Color(red: 0.3, green: 0.4, blue: 0.5)
    static let skyCloudyEnd = Color(red: 0.5, green: 0.6, blue: 0.7)
    
    static let skyRainyStart = Color(red: 0.15, green: 0.25, blue: 0.4)
    static let skyRainyEnd = Color(red: 0.3, green: 0.4, blue: 0.55)
    
    static let skyStormyStart = Color(red: 0.05, green: 0.08, blue: 0.2)
    static let skyStormyEnd = Color(red: 0.15, green: 0.2, blue: 0.35)
}

extension WeatherAnimationType {
    var sfSymbolName: String {
        switch self {
        case .sunny: return "sun.max.fill"
        case .clearNight: return "moon.stars.fill"
        case .partlyCloudy: return "cloud.sun.fill"
        case .cloudy: return "cloud.fill"
        case .lightRain: return "cloud.drizzle.fill"
        case .rain: return "cloud.rain.fill"
        case .heavyRain: return "cloud.heavyrain.fill"
        case .thunderstorm: return "cloud.bolt.rain.fill"
        case .snow: return "snowflake"
        case .blizzard: return "wind.snow"
        case .fog: return "cloud.fog.fill"
        case .hail: return "cloud.hail.fill"
        }
    }
}
