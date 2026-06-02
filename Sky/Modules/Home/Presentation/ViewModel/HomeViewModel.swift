//
//  HomeViewModel.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation

@MainActor
final class HomeViewModel: ObservableObject {
    private let getCurrentWeatherUseCase: GetCurrentWeatherUseCaseProtocol
    private let locationService: LocationService

    @Published var weather: WeatherEntity?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var needsLocationPermission: Bool = false
    @Published var currentAnimation: WeatherAnimationType = .sunny
    @Published var isDaytime: Bool = true

    init(
        getCurrentWeatherUseCase: GetCurrentWeatherUseCaseProtocol,
        locationService: LocationService
    ) {
        self.getCurrentWeatherUseCase = getCurrentWeatherUseCase
        self.locationService = locationService
        updateDaytime()
    }

    func loadWeather() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let coordinate = try await locationService.currentCoordinate()
            let result = try await getCurrentWeatherUseCase.execute(
                lat: coordinate.latitude,
                lon: coordinate.longitude
            )
            self.weather = result
            self.currentAnimation = result.animationType
            self.isDaytime = result.isDay
            self.needsLocationPermission = false
        } catch LocationServiceError.denied {
            self.weather = nil
            self.needsLocationPermission = true
            self.errorMessage = LocationServiceError.denied.errorDescription
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
