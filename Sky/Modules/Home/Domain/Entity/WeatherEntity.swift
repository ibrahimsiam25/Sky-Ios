//
//  WeatherEntity.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import SwiftUI

struct WeatherEntity {
    let cityName: String
    let country: String
    let temperature: Double
    let feelsLike: Double
    let conditionText: String
    let conditionCode: Int
    let conditionIconURL: String
    let humidity: Int
    let visibilityKm: Double
    let pressureMb: Double
    let windKph: Double
    let windDirection: String
    let isDay: Bool
    let localtime: String
    let chanceOfRain: Int

    var animationType: WeatherAnimationType {
        WeatherAnimationType.from(code: conditionCode, isDay: isDay)
    }
}

enum WeatherAnimationType {
    case sunny, clearNight, partlyCloudy, cloudy
    case lightRain, rain, heavyRain, thunderstorm
    case snow, blizzard, fog, hail

    static func from(code: Int, isDay: Bool) -> WeatherAnimationType {
        switch code {
        case 1000: return isDay ? .sunny : .clearNight
        case 1003: return .partlyCloudy
        case 1006, 1009: return .cloudy
        case 1030, 1135, 1147: return .fog
        case 1063, 1150, 1153, 1180, 1183, 1186, 1189: return .lightRain
        case 1192, 1195, 1243, 1246: return .heavyRain
        case 1087, 1273, 1276, 1279, 1282: return .thunderstorm
        case 1066, 1114, 1117, 1210...1225, 1255, 1258: return isDay ? .snow : .blizzard
        case 1237, 1261, 1264: return .hail
        default: return isDay ? .sunny : .clearNight
        }
    }

    var backgroundColors: [Color] {
        switch self {
        case .sunny:
            return [Color(red: 0.25, green: 0.6, blue: 0.9), Color(red: 0.5, green: 0.8, blue: 0.95)]
        case .clearNight:
            return [Color(red: 0.03, green: 0.05, blue: 0.15), Color(red: 0.1, green: 0.15, blue: 0.3)]
        case .partlyCloudy:
            return [Color(red: 0.35, green: 0.55, blue: 0.75), Color(red: 0.55, green: 0.7, blue: 0.85)]
        case .cloudy:
            return [Color(red: 0.3, green: 0.4, blue: 0.5), Color(red: 0.5, green: 0.6, blue: 0.7)]
        case .lightRain, .rain:
            return [Color(red: 0.2, green: 0.3, blue: 0.45), Color(red: 0.35, green: 0.45, blue: 0.6)]
        case .heavyRain:
            return [Color(red: 0.1, green: 0.18, blue: 0.3), Color(red: 0.25, green: 0.33, blue: 0.45)]
        case .thunderstorm:
            return [Color(red: 0.05, green: 0.08, blue: 0.2), Color(red: 0.15, green: 0.2, blue: 0.35)]
        case .snow:
            return [Color(red: 0.45, green: 0.6, blue: 0.75), Color(red: 0.75, green: 0.85, blue: 0.9)]
        case .blizzard:
            return [Color(red: 0.3, green: 0.45, blue: 0.6), Color(red: 0.6, green: 0.7, blue: 0.8)]
        case .fog:
            return [Color(red: 0.35, green: 0.4, blue: 0.45), Color(red: 0.55, green: 0.6, blue: 0.65)]
        case .hail:
            return [Color(red: 0.25, green: 0.35, blue: 0.45), Color(red: 0.45, green: 0.55, blue: 0.65)]
        }
    }

    var textColor: Color {
        return .white
    }
}
