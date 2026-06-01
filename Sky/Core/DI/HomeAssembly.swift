//
//  HomeAssembly.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import Swinject
import SwiftUI
import Combine

class HomeAssembly: Assembly {
    func assemble(container: Container) {

        // 1 API Service

        container.register(WeatherAPIServiceProtocol.self) { r in
            WeatherAPIService(client: r.resolve(NetworkClientProtocol.self)!)
        }.inObjectScope(.container)

        // 2 Repository
        container.register(WeatherRepositoryProtocol.self) { r in
            WeatherRepositoryImpl(apiService: r.resolve(WeatherAPIServiceProtocol.self)!)
        }.inObjectScope(.container)

        // 3 Use Case
        container.register(GetCurrentWeatherUseCaseProtocol.self) { r in
            GetCurrentWeatherUseCase(repository: r.resolve(WeatherRepositoryProtocol.self)!)
        }.inObjectScope(.container)

        // 4 Presenter
        container.register(LocationService.self) { _ in
            LocationService()
        }.inObjectScope(.container)

        container.register(HomePresenter.self) { r in
            HomePresenter(
                getCurrentWeatherUseCase: r.resolve(GetCurrentWeatherUseCaseProtocol.self)!,
                locationService: r.resolve(LocationService.self)!
            )
        }.inObjectScope(.transient)

        // 5 HomeView
        container.register(HomeView.self) { r in
            HomeView(presenter:  r.resolve(HomePresenter.self)!)
        }.inObjectScope(.transient)
    }
}
