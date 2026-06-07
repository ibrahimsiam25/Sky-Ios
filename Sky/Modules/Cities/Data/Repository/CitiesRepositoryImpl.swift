//
//  CitiesRepositoryImpl.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftData
import Foundation

final class CitiesRepositoryImpl: CitiesRepositoryProtocol {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func getSavedCities() throws -> [CityModel] {
        let descriptor = FetchDescriptor<CityDTO >(
            sortBy: [SortDescriptor(\.addedAt, order: .forward)]
        )
        let entities = try context.fetch(descriptor)
        return entities.map { CityModel(entity: $0) }
    }

    func saveCity(_ city: CityModel) throws {
        let descriptor = FetchDescriptor<CityDTO >()
        let existing = try context.fetch(descriptor)
        guard !existing.contains(where: { $0.name == city.name && $0.country == city.country }) else {
            return
        }
        let entity = CityDTO (
            name: city.name,
            country: city.country,
            lat: city.lat,
            lon: city.lon
        )
        context.insert(entity)
        try context.save()
    }

    func deleteCity(id: UUID) throws {
        let descriptor = FetchDescriptor<CityDTO >()
        let entities = try context.fetch(descriptor)
        if let entity = entities.first(where: { $0.id == id }) {
            context.delete(entity)
            try context.save()
        }
    }
}
