//
//  AppContainer.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import Swinject
import SwiftData

final class AppContainer {
    static let shared = AppContainer()
    private let assembler: Assembler

    private init() {
        assembler = Assembler([NetworkAssembly(), HomeAssembly(), CitiesAssembly()])
    }

    private var resolver: Resolver { assembler.resolver }


    func resolveModelContext() -> ModelContext {
        resolver.resolve(ModelContext.self)!
    }


 
    func resolveHomeViewModel(lat: Double? = nil, lon: Double? = nil) -> HomeViewModel {
        let useCase = resolver.resolve(GetCurrentWeatherUseCaseProtocol.self)!
        let locationService = resolver.resolve(LocationService.self)!
        return HomeViewModel(getCurrentWeatherUseCase: useCase, locationService: locationService, lat: lat, lon: lon)
    }


    func resolveCitiesListViewModel(currentCity: CityModel) -> CitiesListViewModel {
        CitiesListViewModel(
            currentCity: currentCity,
            getSavedCities: resolver.resolve(GetSavedCitiesUseCaseProtocol.self)!,
            deleteCity: resolver.resolve(DeleteCityUseCaseProtocol.self)!
        )
    }

   
    func resolveCitySearchViewModel() -> CitySearchViewModel {
        resolver.resolve(CitySearchViewModel.self)!
    }


    func getSavedCities() -> [CityModel] {
        let useCase = resolver.resolve(GetSavedCitiesUseCaseProtocol.self)!
        return (try? useCase.execute()) ?? []
    }


    func resolve<T>(_ type: T.Type) -> T {
        resolver.resolve(T.self)!
    }
}
