//
//  NetworkAssembly.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import Foundation
import Swinject

final class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(URLSession.self) { _ in
            URLSession.shared
        }.inObjectScope(.container)

        container.register(NetworkInterceptor.self) { _ in
            NetworkInterceptor()
        }.inObjectScope(.container)

        container.register(JSONDecoder.self) { _ in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }.inObjectScope(.container)

        container.register(NetworkClientProtocol.self) { r in
            NetworkClient(
                session: r.resolve(URLSession.self)!,
                interceptor: r.resolve(NetworkInterceptor.self)!,
                decoder: r.resolve(JSONDecoder.self)!
            )
        }.inObjectScope(.container)
    }
}
