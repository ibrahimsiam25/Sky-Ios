//
//  GetCurrentWeatherUseCase.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

final class GetCurrentWeatherUseCase: GetCurrentWeatherUseCaseProtocol {
    private let repository: WeatherRepositoryProtocol
    
    init(repository: WeatherRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(lat: Double, lon: Double) async throws -> WeatherEntity {
        try await repository.getCurrentWeather(lat: lat, lon: lon)
    }
}
