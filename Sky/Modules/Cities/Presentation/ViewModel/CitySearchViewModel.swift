//
//  CitySearchViewModel.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI
import Combine

@MainActor
final class CitySearchViewModel: ObservableObject {

    private let saveCity: SaveCityUseCaseProtocol
    private let localCitiesService: LocalCitiesServiceProtocol

    @Published var searchText: String = ""
    @Published var successMessage: String?
    @Published var errorMessage: String?

    var onCityAdded: (() -> Void)?

    init(saveCity: SaveCityUseCaseProtocol, localCitiesService: LocalCitiesServiceProtocol) {
        self.saveCity = saveCity
        self.localCitiesService = localCitiesService
    }

    var filteredCities: [LocalCity] {
        let allCities = localCitiesService.getLocalCities()
        if searchText.isEmpty { return allCities }
        return allCities.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.country.localizedCaseInsensitiveContains(searchText)
        }
    }

    func addCity(_ localCity: LocalCity) {
        let model = CityModel(
            id: UUID(),
            name: localCity.name,
            country: localCity.country,
            lat: localCity.lat,
            lon: localCity.lon,
            addedAt: Date()
        )
        do {
            try saveCity.execute(model)
            successMessage = "\(localCity.name) added!"
            onCityAdded?()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
