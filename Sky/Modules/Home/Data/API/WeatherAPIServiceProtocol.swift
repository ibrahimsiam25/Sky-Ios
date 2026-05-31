//
//  WeatherAPIServiceProtocol.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

protocol WeatherAPIServiceProtocol {
    func fetchCurrentWeather(lat: Double, lon: Double) async throws -> WeatherResponseDTO
}
