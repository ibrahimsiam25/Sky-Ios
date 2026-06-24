//
//  CitySearchRowView.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI

struct CitySearchRowView: View {

    let city: LocalCity
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)

                VStack(alignment: .leading, spacing: 3) {
                    Text(city.name)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.primary)
                    Text(city.country)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .font(.system(size: 20))
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(.plain)
    }
}
