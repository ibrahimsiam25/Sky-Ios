//
//  WeatherRepositoryProtocol.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func getCurrentWeather(lat: Double, lon: Double) async throws -> WeatherResponseDTO
}
