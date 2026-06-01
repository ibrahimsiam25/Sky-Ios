//
//  HomeView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject private var presenter: HomePresenter
    @State private var animateIn = false
    @State private var showSearchView = false

    init(presenter: HomePresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }

    var body: some View {
        ZStack {
            WeatherBackgroundView(animation: presenter.currentAnimation)
                .ignoresSafeArea()

            if let weather = presenter.weather {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        NavBarView(textColor: presenter.currentAnimation.textColor) {
                            showSearchView = true
                        }
                        WeatherTopSection(weather: weather, presenter: presenter, animateIn: animateIn)
                        ForecastCard(presenter: presenter)
                        WeatherStatsGrid(presenter: presenter)
                    }
                }
                .onAppear { animateIn = true }

            } else if presenter.needsLocationPermission {
                VStack(spacing: 16) {
                    Image(systemName: "location.slash")
                        .font(.system(size: 64))
                        .foregroundColor(.white)

                    Text("Location Required")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(presenter.errorMessage ?? "Please allow location access to show your weather.")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    HStack(spacing: 12) {
                        Button(action: openSettings) {
                            Text("Open Settings")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(Color.white)
                                .cornerRadius(8)
                        }

                        Button(action: { Task { await presenter.loadWeather() } }) {
                            Text("Retry")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }

            } else if let errorMsg = presenter.errorMessage {
               
                VStack(spacing: 16) {
                    Image(systemName: "wifi.slash").font(.system(size: 64)).foregroundColor(.white)
                    Text("Something Went Wrong").font(.title2).fontWeight(.bold).foregroundColor(.white)
                    Text(errorMsg).font(.body).foregroundColor(.white.opacity(0.8)).multilineTextAlignment(.center).padding(.horizontal, 32)
                    Button(action: { Task { await presenter.loadWeather() } }) {
                        Text("Retry").fontWeight(.semibold).foregroundColor(.blue)
                            .padding(.horizontal, 24).padding(.vertical, 12)
                            .background(Color.white).cornerRadius(8)
                    }
                }
            }

            if presenter.isLoading {
                ZStack {
                    Color.black.opacity(0.3).ignoresSafeArea()
                    VStack(spacing: 12) {
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).scaleEffect(1.5)
                        Text("Fetching Weather...").foregroundColor(.white).font(.subheadline)
                    }
                    .padding(24).background(.ultraThinMaterial).cornerRadius(16)
                }
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showSearchView) { SearchView() }
        .task { await presenter.loadWeather() }
    }

    private func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }
}
