//
//  CitiesListView.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI

struct CitiesListView: View {

    @StateObject private var viewModel: CitiesListViewModel
    @State private var showSearch = false

    init(viewModel: CitiesListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundApp.ignoresSafeArea()

                List {
                    ForEach(viewModel.allCities) { city in
                        CityRowView(
                            city: city,
                            isLocked: city.id == viewModel.currentCity.id
                        )
                        .listRowBackground(Color.white.opacity(0.06))
                        .listRowSeparatorTint(.white.opacity(0.1))
                        // Swipe to delete — only for non-current cities
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            if city.id != viewModel.currentCity.id {
                                Button(role: .destructive) {
                                    viewModel.requestDelete(city)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }

                    // Add City button row
                    Button {
                        showSearch = true
                    } label: {
                        Label("Add City", systemImage: "plus.circle.fill")
                            .foregroundColor(.primaryApp)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .listRowBackground(Color.white.opacity(0.04))
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("My Cities")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            // Delete confirmation alert
            .alert("Delete City", isPresented: $viewModel.showDeleteAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    viewModel.confirmDelete()
                }
            } message: {
                Text("Remove \\(viewModel.cityToDelete?.name ?? \"this city\") from your list?")
            }
            .navigationDestination(isPresented: $showSearch) {
                CitySearchView(
                    viewModel: AppContainer.shared.resolveCitySearchViewModel(),
                    onCityAdded: { viewModel.loadCities() }
                )
            }
        }
        .onAppear { viewModel.loadCities() }
    }
}
