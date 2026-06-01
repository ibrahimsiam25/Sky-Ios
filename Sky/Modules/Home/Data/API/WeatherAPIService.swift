//
//  WeatherAPIService.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation



class WeatherAPIService: WeatherAPIServiceProtocol {
    private let client: NetworkClientProtocol
    private let forecastEndpoint = "forecast.json"
   

    init(client: NetworkClientProtocol) {
        self.client = client
    }
    
    func fetchCurrentWeather(lat: Double, lon: Double) async throws -> WeatherResponseDTO {
        let params = CurrentWeatherParams(lat: lat, lon: lon)
        return try await client.request(
            endpoint: forecastEndpoint,
            params: params.asDictionary
        )
    }
}
