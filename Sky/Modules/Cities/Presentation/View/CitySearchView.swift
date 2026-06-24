//
//  CitySearchView.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI

struct CitySearchView: View {

    @StateObject private var viewModel: CitySearchViewModel
    @Environment(\.dismiss) private var dismiss

    let onCityAdded: () -> Void

    init(viewModel: CitySearchViewModel, onCityAdded: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onCityAdded = onCityAdded
    }

    var body: some View {
        VStack(spacing: 0) {
        
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search city...", text: $viewModel.searchText)
                    .autocorrectionDisabled()
            }
            .padding(12)
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(12)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

      
            List(viewModel.filteredCities) { city in
                CitySearchRowView(city: city) {
                    viewModel.addCity(city)
                    onCityAdded()
                    dismiss()
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Add City")
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) {
            if let msg = viewModel.successMessage {
                Text(msg)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .cornerRadius(20)
                    .padding(.bottom, 30)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
