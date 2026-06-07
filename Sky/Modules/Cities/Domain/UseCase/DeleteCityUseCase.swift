//
//  DeleteCityUseCase.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import Foundation

protocol DeleteCityUseCaseProtocol {
    func execute(id: UUID) throws
}

final class DeleteCityUseCase: DeleteCityUseCaseProtocol {
    private let repository: CitiesRepositoryProtocol

    init(repository: CitiesRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: UUID) throws {
        try repository.deleteCity(id: id)
    }
}
