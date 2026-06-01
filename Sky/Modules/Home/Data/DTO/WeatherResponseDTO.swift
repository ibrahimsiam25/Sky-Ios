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
    let forecast: ForecastDTO
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

struct ForecastDTO: Codable {
    let forecastday: [ForecastDayDTO]
}

struct ForecastDayDTO: Codable {
    let date: String
    let day: DayDTO
    let hour: [HourDTO]
}

struct DayDTO: Codable {
    let maxtempC: Double
    let mintempC: Double
    let condition: ConditionDTO
}

struct HourDTO: Codable {
    let time: String
    let tempC: Double
    let condition: ConditionDTO
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
            chanceOfRain: current.chanceOfRain ?? 0,
            forecastDays: forecast.forecastday.enumerated().map { index, item in
                ForecastDayEntity(
                    title: dayTitle(for: index),
                    date: item.date,
                    minTemp: item.day.mintempC,
                    maxTemp: item.day.maxtempC,
                    conditionText: item.day.condition.text,
                    conditionCode: item.day.condition.code,
                    hours: item.hour.map {
                        HourWeatherEntity(
                            time: timeOnly(from: $0.time),
                            temperature: $0.tempC,
                            conditionText: $0.condition.text,
                            conditionCode: $0.condition.code
                        )
                    }
                )
            }
        )
    }

    private func dayTitle(for index: Int) -> String {
        switch index {
        case 0:
            return "Today"
        case 1:
            return "Tomorrow"
        default:
            return "After Tomorrow"
        }
    }

    private func timeOnly(from value: String) -> String {
        String(value.suffix(5))
    }
}
