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

    
    func resolve<T>(_ type: T.Type) -> T {
        assembler.resolver.resolve(T.self)!
    }
}
