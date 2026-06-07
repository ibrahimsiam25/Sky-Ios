//
//  CityModel.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import Foundation

struct CityModel: Identifiable, Equatable {
    let id: UUID
    let name: String
    let country: String
    let lat: Double
    let lon: Double
    let addedAt: Date
}

// Map from SwiftData entity
extension CityModel {
    init(entity: CityEntity) {
        self.id = entity.id
        self.name = entity.name
        self.country = entity.country
        self.lat = entity.lat
        self.lon = entity.lon
        self.addedAt = entity.addedAt
    }
}
