//
//  WeatherRepositoryImpl.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

class WeatherRepositoryImpl: WeatherRepositoryProtocol {
    private let apiService: WeatherAPIServiceProtocol
    
    init(apiService: WeatherAPIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCurrentWeather(lat: Double, lon: Double) async throws -> WeatherResponseDTO {
        let dto = try await apiService.fetchCurrentWeather(lat: lat, lon: lon)
        return dto
    }
}
