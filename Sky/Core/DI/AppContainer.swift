//
//  AppContainer.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import Foundation
import Swinject

final class AppContainer {
    static let shared = AppContainer()
    let resolver: Resolver

    private init() {
        let assembler = Assembler([
            NetworkAssembly(),
            HomeAssembly()
        ])
        self.resolver = assembler.resolver
    }

    func resolve<T>(_ type: T.Type) -> T {
        resolver.resolve(T.self)!
    }
}
