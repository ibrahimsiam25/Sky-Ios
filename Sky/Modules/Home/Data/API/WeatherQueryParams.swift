//
//  WeatherQueryParams.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

struct CurrentWeatherParams: QueryParamsProtocol {
    let lat: Double
    let lon: Double

    private let days = "3"
    private let lang = "en"
    private let aqi = "no"

    var asDictionary: [String: String] {
        [
            "key": key,
            "q": "\(lat),\(lon)",
            "days": days,
            "lang": lang,
            "aqi": aqi
        ]
    }
}
