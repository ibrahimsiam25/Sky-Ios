//
//  CitiesRepositoryProtocol.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import Foundation

protocol CitiesRepositoryProtocol {
    func getSavedCities() throws -> [CityModel]
    func saveCity(_ city: CityModel) throws
    func deleteCity(id: UUID) throws
}
