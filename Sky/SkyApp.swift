//
//  SkyApp.swift
//  Sky
//
//  Created by siam on 28/05/2026.
//

import SwiftUI

@main
struct SkyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AppContainer.shared.resolve(HomeView.self)
            }
        }
    }
}
