//
//  WeatherStatsGrid.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct WeatherStatsGrid: View {
    let viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                StatCard(icon: "eye.fill", title: "Visibility", value: viewModel.visibilityText, textColor: viewModel.currentAnimation.textColor)
                StatCard(icon: "drop.fill", title: "Humidity", value: viewModel.humidityText, textColor: viewModel.currentAnimation.textColor)
            }
            HStack(spacing: 12) {
                StatCard(icon: "thermometer", title: "Feels Like", value: viewModel.feelsLikeText, textColor: viewModel.currentAnimation.textColor)
                StatCard(icon: "gauge.with.needle", title: "Pressure", value: viewModel.pressureText, textColor: viewModel.currentAnimation.textColor)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
    }
}
