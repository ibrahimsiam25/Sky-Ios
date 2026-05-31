//
//  WeatherResponseDTO.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation

struct WeatherResponseDTO: Codable {
    let location: LocationDTO
    let current: CurrentDTO
}

struct LocationDTO: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let localtime: String
}

struct CurrentDTO: Codable {
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: ConditionDTO
    let windKph: Double
    let windDir: String
    let pressureMb: Double
    let humidity: Int
    let feelslikeC: Double
    let visKm: Double
    let uv: Double
    let chanceOfRain: Int?
}

struct ConditionDTO: Codable {
    let text: String
    let icon: String
    let code: Int
}

extension WeatherResponseDTO {
    func toWeatherEntity() -> WeatherEntity {
        WeatherEntity(
            cityName: location.name,
            country: location.country,
            temperature: current.tempC,
            feelsLike: current.feelslikeC,
            conditionText: current.condition.text,
            conditionCode: current.condition.code,
            conditionIconURL: current.condition.icon,
            humidity: current.humidity,
            visibilityKm: current.visKm,
            pressureMb: current.pressureMb,
            windKph: current.windKph,
            windDirection: current.windDir,
            isDay: current.isDay == 1,
            localtime: location.localtime,
            chanceOfRain: current.chanceOfRain ?? 0
        )
    }
}
