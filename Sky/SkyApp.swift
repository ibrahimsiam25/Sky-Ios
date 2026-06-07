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
            HomeCarouselContainerView(
                viewModel: AppContainer.shared.resolveHomeViewModel()
            )
            .modelContainer(AppContainer.shared.resolveModelContext().container)
        }
    }
}
