//
//  ForecastCard.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct ForecastCard: View {
    let presenter: HomePresenter

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("3-DAY FORECAST")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(presenter.currentAnimation.textColor.opacity(0.6))
                .padding(.horizontal, 16)
                .padding(.top, 12)

            Divider()
                .background(presenter.currentAnimation.textColor.opacity(0.3))

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
    }
}
