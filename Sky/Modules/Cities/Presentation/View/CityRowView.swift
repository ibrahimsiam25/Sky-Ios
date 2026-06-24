//
//  CityRowView.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import SwiftUI

struct CityRowView: View {

    let city: CityModel
    let isLocked: Bool    

    var body: some View {
        HStack(spacing: 14) {

            Image(systemName: isLocked ? "location.fill" : "mappin.circle.fill")
                .font(.system(size: 22))
                .foregroundColor(isLocked ? .blue : .secondary)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 3) {
                Text(city.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                Text(city.country)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            Spacer()

            if isLocked {
                Text("Current")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(20)
            }
        }
        .padding(.vertical, 6)
    }
}
