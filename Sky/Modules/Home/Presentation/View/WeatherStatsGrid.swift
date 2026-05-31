//
//  WeatherStatsGrid.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct WeatherStatsGrid: View {
    let presenter: HomePresenter

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                StatCard(icon: "eye.fill", title: "Visibility", value: presenter.visibilityText, textColor: presenter.currentAnimation.textColor)
                StatCard(icon: "drop.fill", title: "Humidity", value: presenter.humidityText, textColor: presenter.currentAnimation.textColor)
            }
            HStack(spacing: 12) {
                StatCard(icon: "thermometer", title: "Feels Like", value: presenter.feelsLikeText, textColor: presenter.currentAnimation.textColor)
                StatCard(icon: "gauge.with.needle", title: "Pressure", value: presenter.pressureText, textColor: presenter.currentAnimation.textColor)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
}
