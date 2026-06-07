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

        // SwiftData ModelContext — singleton
        container.register(ModelContext.self) { _ in
            let schema = Schema([CityEntity.self])
            let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            let container = try! ModelContainer(for: schema, configurations: [config])
            return ModelContext(container)
        }.inObjectScope(.container)

        // Repository
        container.register(CitiesRepositoryProtocol.self) { r in
            CitiesRepositoryImpl(context: r.resolve(ModelContext.self)!)
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

        // Search ViewModel
        container.register(CitySearchViewModel.self) { r in
            CitySearchViewModel(saveCity: r.resolve(SaveCityUseCaseProtocol.self)!)
        }
    }
}
