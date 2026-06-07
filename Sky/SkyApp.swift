//
//  SkyApp.swift
//  Sky
//
//  Created by siam on 28/05/2026.
//

import SwiftUI
import SwiftData

@main
struct SkyApp: App {
    var body: some Scene {
        WindowGroup {
            let container = AppContainer.shared
            HomeCarouselContainerView(
                viewModel: container.resolveHomeViewModel(),
                container: container
            )
            .modelContainer(AppContainer.shared.resolveModelContext().container)
        }
    }
}
