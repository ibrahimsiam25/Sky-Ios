//
//  GetCurrentWeatherUseCaseProtocol.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

protocol GetCurrentWeatherUseCaseProtocol {
    func execute(lat: Double, lon: Double) async throws -> WeatherEntity
}
