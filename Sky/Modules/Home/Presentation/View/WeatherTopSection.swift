//
//  WeatherTopSection.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct WeatherTopSection: View {
    let weather: WeatherEntity
    let viewModel: HomeViewModel
    let animateIn: Bool

    var body: some View {
        VStack(spacing: 8) {
            Text(weather.cityName)
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(viewModel.currentAnimation.textColor)
                .opacity(animateIn ? 1.0 : 0.0)
                .offset(y: animateIn ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.0), value: animateIn)

            Text(viewModel.temperatureText)
                .font(.system(size: 96, weight: .bold))
                .foregroundColor(viewModel.currentAnimation.textColor)
                .opacity(animateIn ? 1.0 : 0.0)
                .offset(y: animateIn ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.1), value: animateIn)

            Text(weather.conditionText)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(viewModel.currentAnimation.textColor.opacity(0.85))
                .opacity(animateIn ? 1.0 : 0.0)
                .offset(y: animateIn ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.2), value: animateIn)

            Image(systemName: viewModel.currentAnimation.sfSymbolName)
                .font(.system(size: 60))
                .foregroundColor(viewModel.currentAnimation.textColor)
                .padding(.vertical, 8)
                .opacity(animateIn ? 1.0 : 0.0)
                .offset(y: animateIn ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.3), value: animateIn)

            let mockHigh = Int(round(weather.temperature + 3))
            let mockLow = Int(round(weather.temperature - 5))
            Text("H:\(mockHigh)°  L:\(mockLow)°")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(viewModel.currentAnimation.textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
                .opacity(animateIn ? 1.0 : 0.0)
                .offset(y: animateIn ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.4), value: animateIn)
        }
        .padding(.top, 10)
    }
}
