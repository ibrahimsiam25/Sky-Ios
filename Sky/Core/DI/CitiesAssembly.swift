//
//  CitiesAssembly.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import Swinject
import SwiftData

final class CitiesAssembly: Assembly {
    func assemble(container: Container) {

        // Repository
        container.register(CitiesRepositoryProtocol.self) { _ in
            CitiesRepositoryImpl(context: DatabaseManager.shared.context)
        }

        // Use Cases
        container.register(GetSavedCitiesUseCaseProtocol.self) { r in
            GetSavedCitiesUseCase(repository: r.resolve(CitiesRepositoryProtocol.self)!)
        }
        container.register(SaveCityUseCaseProtocol.self) { r in
            SaveCityUseCase(repository: r.resolve(CitiesRepositoryProtocol.self)!)
        }
        container.register(DeleteCityUseCaseProtocol.self) { r in
            DeleteCityUseCase(repository: r.resolve(CitiesRepositoryProtocol.self)!)
        }

        // Local Cities Service
        container.register(LocalCitiesServiceProtocol.self) { _ in
            LocalCitiesService()
        }.inObjectScope(.container)

        // Search ViewModel
        container.register(CitySearchViewModel.self) { r in
            CitySearchViewModel(
                saveCity: r.resolve(SaveCityUseCaseProtocol.self)!,
                localCitiesService: r.resolve(LocalCitiesServiceProtocol.self)!
            )
        }
    }
}
