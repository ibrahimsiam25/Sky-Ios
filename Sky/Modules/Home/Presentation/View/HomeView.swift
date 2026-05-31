//
//  HomeView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var presenter: HomePresenter
    
    @State private var animateIn = false
    @State private var showSearchView = false

    init(presenter: HomePresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }
    
    var body: some View {
        ZStack {
            // Z Layer 0: Weather Background
            WeatherBackgroundView(animation: presenter.currentAnimation)
                .ignoresSafeArea()
            
            // Z Layer 1: Main Scroll Content
            if let weather = presenter.weather {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Custom Nav Top Area (Search Button)
                        HStack {
                            Spacer()
                            Button(action: { showSearchView = true }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(presenter.currentAnimation.textColor)
                                    .padding(12)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())
                            }
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                        }
                        
                        // TOP SECTION
                        VStack(spacing: 8) {
                            Text(weather.cityName)
                                .font(.system(size: 38, weight: .thin, design: .default))
                                .foregroundColor(presenter.currentAnimation.textColor)
                                .opacity(animateIn ? 1.0 : 0.0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(.easeOut(duration: 0.6).delay(0.0), value: animateIn)
                            
                            Text(presenter.temperatureText)
                                .font(.system(size: 96, weight: .ultraLight, design: .default))
                                .foregroundColor(presenter.currentAnimation.textColor)
                                .opacity(animateIn ? 1.0 : 0.0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(.easeOut(duration: 0.6).delay(0.1), value: animateIn)
                            
                            Text(weather.conditionText)
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .foregroundColor(presenter.currentAnimation.textColor.opacity(0.85))
                                .opacity(animateIn ? 1.0 : 0.0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(.easeOut(duration: 0.6).delay(0.2), value: animateIn)
                            
                            Image(systemName: presenter.currentAnimation.sfSymbolName)
                                .font(.system(size: 60))
                                .foregroundColor(presenter.currentAnimation.textColor)
                                .padding(.vertical, 8)
                                .opacity(animateIn ? 1.0 : 0.0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(.easeOut(duration: 0.6).delay(0.3), value: animateIn)
                            
                            // H/L pill
                            let mockHigh = Int(round(weather.temperature + 3))
                            let mockLow = Int(round(weather.temperature - 5))
                            Text("H:\(mockHigh)°  L:\(mockLow)°")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(presenter.currentAnimation.textColor)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                                .opacity(animateIn ? 1.0 : 0.0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(.easeOut(duration: 0.6).delay(0.4), value: animateIn)
                        }
                        .padding(.top, 10)
                        
                        // MIDDLE SECTION — "3-DAY FORECAST" card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("3-DAY FORECAST")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(presenter.currentAnimation.textColor.opacity(0.6))
                                .padding(.horizontal, 16)
                                .padding(.top, 12)
                            
                            Divider()
                                .background(presenter.currentAnimation.textColor.opacity(0.3))
                            
                            NavigationLink(destination: HourlyForecastView()) {
                                HStack {
                                    Text("TODAY")
                                        .font(.headline)
                                        .foregroundColor(presenter.currentAnimation.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: presenter.currentAnimation.sfSymbolName)
                                        .foregroundColor(presenter.currentAnimation.textColor)
                                    
                                    Spacer()
                                    
                                    Text(presenter.temperatureText)
                                        .font(.headline)
                                        .foregroundColor(presenter.currentAnimation.textColor)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                            }
                            
                            Text("Upgrade to /forecast.json for 3-day data")
                                .font(.footnote)
                                .italic()
                                .foregroundColor(presenter.currentAnimation.textColor.opacity(0.6))
                                .padding(.horizontal, 16)
                                .padding(.bottom, 12)
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                        
                        // BOTTOM SECTION — Weather Stats grid
                        VStack(spacing: 12) {
                            HStack(spacing: 12) {
                                // Visibility Card
                                StatCard(
                                    icon: "eye.fill",
                                    title: "Visibility",
                                    value: presenter.visibilityText,
                                    textColor: presenter.currentAnimation.textColor
                                )
                                
                                // Humidity Card
                                StatCard(
                                    icon: "droplet.fill",
                                    title: "Humidity",
                                    value: presenter.humidityText,
                                    textColor: presenter.currentAnimation.textColor
                                )
                            }
                            
                            HStack(spacing: 12) {
                                // Feels Like Card
                                StatCard(
                                    icon: "thermometer",
                                    title: "Feels Like",
                                    value: presenter.feelsLikeText,
                                    textColor: presenter.currentAnimation.textColor
                                )
                                
                                // Pressure Card
                                StatCard(
                                    icon: "gauge.with.needle",
                                    title: "Pressure",
                                    value: presenter.pressureText,
                                    textColor: presenter.currentAnimation.textColor
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    }
                }
                .onAppear {
                    animateIn = true
                }
            } else if let errorMsg = presenter.errorMessage {
                // ERROR STATE
                VStack(spacing: 16) {
                    Image(systemName: "wifi.slash")
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                    
                    Text("Something Went Wrong")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(errorMsg)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    
                    Button(action: {
                        Task {
                            await presenter.loadWeather()
                        }
                    }) {
                        Text("Retry")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            // Z Layer 2: Loading overlay
            if presenter.isLoading {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 12) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                        
                        Text("Fetching Weather...")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    .padding(24)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                }
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showSearchView) {
            SearchView()
        }
        .task {
            await presenter.loadWeather()
        }
    }
}

struct StatCard: View {
    let icon: String
    let title: String
    let value: String
    let textColor: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(textColor.opacity(0.8))
            
            Text(value)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(textColor)
            
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(textColor.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.12))
        .cornerRadius(16)
    }
}
