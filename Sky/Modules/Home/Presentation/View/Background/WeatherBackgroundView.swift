//
//  WeatherBackgroundView.swift
//  Sky
//
//  Created by siam on 05/06/2026.
//

import SwiftUI

struct WeatherBackgroundView: View {
    let animation: WeatherAnimationType

    var body: some View {
        LoopedVideoPlayerView(videoName: animation.videoAssetName)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .allowsHitTesting(false)
            .ignoresSafeArea()
    }
}


extension WeatherAnimationType {
    var videoAssetName: String {
        switch self {
        case .sunny:                    return "Sunny"
        case .clearNight:               return "Clear Night"
        case .partlyCloudy:             return "Partly Cloudy"
        case .cloudy:                   return "Cloudy"
        case .lightRain, .rain,
             .heavyRain:                return "Rain"
        case .thunderstorm:             return "Thunderstorm"
        case .snow, .blizzard, .hail:   return "Snow"
        case .fog:                      return "Cloudy"
        }
    }
}
