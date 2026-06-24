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
            List {
                ForEach(viewModel.allCities) { city in
                    CityRowView(
                        city: city,
                        isLocked: city.id == viewModel.currentCity.id
                    )
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
                    Button {
                        showSearch = true
                    } label: {
                        Label("Add City", systemImage: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
                .navigationTitle("My Cities")
                .navigationBarTitleDisplayMode(.inline)
            .alert("Delete City", isPresented: $viewModel.showDeleteAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    viewModel.confirmDelete()
                }
            } message: {
                Text( "are you sure you want to delete \(viewModel.cityToDelete?.name ?? "this city") from your list?")
                         
            }
            .navigationDestination(isPresented: $showSearch) {
                CitySearchView(
                    viewModel: AppContainer.shared.resolve(CitySearchViewModel.self),
                    onCityAdded: {
                        viewModel.loadCities()
                    }
                )
            }
        }
        .onAppear { viewModel.loadCities() }
    }
}
