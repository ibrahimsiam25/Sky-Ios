//
//  CitiesListViewModel.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI
import Combine

@MainActor
final class CitiesListViewModel: ObservableObject {

    private let getSavedCities: GetSavedCitiesUseCaseProtocol
    private let deleteCity: DeleteCityUseCaseProtocol

    @Published var savedCities: [CityModel] = []
    @Published var cityToDelete: CityModel?       
    @Published var showDeleteAlert = false
    @Published var errorMessage: String?

    let currentCity: CityModel

    init(
        currentCity: CityModel,
        getSavedCities: GetSavedCitiesUseCaseProtocol,
        deleteCity: DeleteCityUseCaseProtocol
    ) {
        self.currentCity = currentCity
        self.getSavedCities = getSavedCities
        self.deleteCity = deleteCity
    }

    func loadCities() {
        do {
            savedCities = try getSavedCities.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

  
    func requestDelete(_ city: CityModel) {
        cityToDelete = city
        showDeleteAlert = true
    }


    func confirmDelete() {
        guard let city = cityToDelete else { return }
        do {
            try deleteCity.execute(id: city.id)
            savedCities.removeAll { $0.id == city.id }
        } catch {
            errorMessage = error.localizedDescription
        }
        cityToDelete = nil
    }
    var allCities: [CityModel] { [currentCity] + savedCities }
}
