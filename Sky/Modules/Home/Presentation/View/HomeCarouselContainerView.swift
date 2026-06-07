//
//  HomeCarouselContainerView.swift
//  Sky
//
//  Created by siam on 05/06/2026.
//

import SwiftUI
import SwiftData

struct HomeCarouselContainerView: View {

    @StateObject private var gpsViewModel: HomeViewModel
    @State private var currentActiveIndex: Int = 0
    @State private var pageAnimations: [Int: WeatherAnimationType] = [0: .sunny]
    @State private var showCitiesList = false

    @Query(sort: \CityEntity.addedAt) private var savedCityEntities: [CityEntity]
    init(viewModel: HomeViewModel) {
        _gpsViewModel = StateObject(wrappedValue: viewModel)
    }

    var savedCities: [CityModel] {
        savedCityEntities.map { CityModel(entity: $0) }
    }

    var activeAnimation: WeatherAnimationType {
        pageAnimations[currentActiveIndex] ?? .sunny
    }

    var body: some View {
        ZStack {
            WeatherBackgroundView(animation: activeAnimation)
                .ignoresSafeArea(.all)

            TabView(selection: $currentActiveIndex) {
                HomeView(viewModel: gpsViewModel, onAnimationChange: { anim in
                    pageAnimations[0] = anim
                })
                .tag(0)

                ForEach(Array(savedCities.enumerated()), id: \.element.id) { index, city in
                    let pageIndex = index + 1
                    let vm = AppContainer.shared.resolveHomeViewModel(lat: city.lat, lon: city.lon)
                    HomeView(viewModel: vm, onAnimationChange: { anim in
                        pageAnimations[pageIndex] = anim
                    })
                    .tag(pageIndex)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.clear)
            .ignoresSafeArea(.all)
            .toolbarBackground(.hidden, for: .navigationBar)

            plusButton
        }
        .ignoresSafeArea(.all)
        .sheet(isPresented: $showCitiesList) { citiesSheet }
    }



    private var plusButton: some View {
        VStack {
            HStack {
                Spacer()
                Button { showCitiesList = true } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                .padding(.trailing, 20)
                .padding(.top, 56)
            }
            Spacer()
        }
    }

    private var citiesSheet: some View {
        let currentCity = CityModel(
            id: UUID(),
            name: gpsViewModel.weather?.cityName ?? "Current Location",
            country: "GPS",
            lat: 0,
            lon: 0,
            addedAt: Date()
        )
        let vm = AppContainer.shared.resolveCitiesListViewModel(currentCity: currentCity)
        return CitiesListView(viewModel: vm)
    }
}
