//
//  HomeViewModel.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class HomePresenter: ObservableObject {
    private let getCurrentWeatherUseCase: GetCurrentWeatherUseCaseProtocol

    @Published var weather: WeatherEntity?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var currentAnimation: WeatherAnimationType = .sunny
    @Published var isDaytime: Bool = true

    init(getCurrentWeatherUseCase: GetCurrentWeatherUseCaseProtocol) {
        self.getCurrentWeatherUseCase = getCurrentWeatherUseCase
        updateDaytime()
    }

    func loadWeather() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let result = try await getCurrentWeatherUseCase.execute(lat: 30.0444, lon: 31.2357)
            self.weather = result
            self.currentAnimation = result.animationType
            self.isDaytime = result.isDay
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    private func updateDaytime() {
        let hour = Calendar.current.component(.hour, from: Date())
        isDaytime = hour >= 5 && hour < 18
    }

    var temperatureText: String { weather.map { "\(Int(round($0.temperature)))°" } ?? "--°" }
    var humidityText: String { weather.map { "\($0.humidity)%" } ?? "--%" }
    var visibilityText: String { weather.map { "\($0.visibilityKm) km" } ?? "-- km" }
    var pressureText: String { weather.map { "\(Int(round($0.pressureMb))) hPa" } ?? "-- hPa" }
    var feelsLikeText: String { weather.map { "\(Int(round($0.feelsLike)))°" } ?? "--°" }
}
