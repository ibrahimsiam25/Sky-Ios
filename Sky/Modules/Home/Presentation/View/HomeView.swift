//
//  HomeView.swift
//  Sky
//
//  Created by siam on 05/06/2026.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel
    @State private var animateIn = false

    
    let onAnimationChange: ((WeatherAnimationType) -> Void)?

    init(viewModel: HomeViewModel,
         onAnimationChange: ((WeatherAnimationType) -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onAnimationChange = onAnimationChange
    }

    var body: some View {
        ZStack {
            Color.clear

            if let weather = viewModel.weather {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        WeatherTopSection(
                            weather: weather,
                            viewModel: viewModel,
                            animateIn: animateIn
                        )
                        .id(weather.cityName)
                        ForecastCard(viewModel: viewModel)
                        WeatherStatsGrid(viewModel: viewModel)
                    }
                }
                .onAppear { animateIn = true }

            } else if viewModel.needsLocationPermission {
                PagePermissionView(viewModel: viewModel)
            } else if let msg = viewModel.errorMessage {
                PageErrorView(message: msg) {
                    Task { await viewModel.loadWeather() }
                }
            }

            if viewModel.isLoading { PageLoadingView() }
        }
        .onChange(of: viewModel.currentAnimation) { _, anim in
            onAnimationChange?(anim)
        }
        .onAppear {
            onAnimationChange?(viewModel.currentAnimation)
        }
        .task {
            await viewModel.loadWeatherIfNeeded()
        }
    }
}
