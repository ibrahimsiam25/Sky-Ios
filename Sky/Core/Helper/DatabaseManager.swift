//
//  DatabaseManager.swift
//  Sky
//
//  Created by siam on 07/06/2026.
//

import SwiftData
import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()

    let container: ModelContainer
    let context: ModelContext

    private init() {
        let schema = Schema([CityDTO.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            let container = try ModelContainer(for: schema, configurations: [config])
            self.container = container
            self.context = ModelContext(container)
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
}
