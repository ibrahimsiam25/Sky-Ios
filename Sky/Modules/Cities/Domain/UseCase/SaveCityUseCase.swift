//
//  SaveCityUseCase.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

protocol SaveCityUseCaseProtocol {
    func execute(_ city: CityModel) throws
}

final class SaveCityUseCase: SaveCityUseCaseProtocol {
    private let repository: CitiesRepositoryProtocol

    init(repository: CitiesRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ city: CityModel) throws {
        try repository.saveCity(city)
    }
}
