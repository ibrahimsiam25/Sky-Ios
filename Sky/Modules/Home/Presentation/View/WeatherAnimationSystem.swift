//
//  WeatherAnimationSystem.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI



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
