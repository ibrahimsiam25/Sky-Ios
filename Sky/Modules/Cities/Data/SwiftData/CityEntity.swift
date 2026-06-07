//
//  CityEntity.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftData
import Foundation

@Model
final class CityEntity {
    @Attribute(.unique) var id: UUID
    var name: String
    var country: String
    var lat: Double
    var lon: Double
    var addedAt: Date

    init(name: String, country: String, lat: Double, lon: Double) {
        self.id = UUID()
        self.name = name
        self.country = country
        self.lat = lat
        self.lon = lon
        self.addedAt = Date()
    }
}
