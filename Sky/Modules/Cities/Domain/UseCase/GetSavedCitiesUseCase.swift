//
//  GetSavedCitiesUseCase.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

protocol GetSavedCitiesUseCaseProtocol {
    func execute() throws -> [CityModel]
}

final class GetSavedCitiesUseCase: GetSavedCitiesUseCaseProtocol {
    private let repository: CitiesRepositoryProtocol

    init(repository: CitiesRepositoryProtocol) {
        self.repository = repository
    }

    func execute() throws -> [CityModel] {
        try repository.getSavedCities()
    }
}
