//
//  HourlyForecastView.swift
//  Sky
//
//  Created by siam on 23/06/2026.
//


import SwiftUI

struct HourlyForecastView: View {
    let day: ForecastDayEntity

    var body: some View {
        NavigationView {
            List(day.hours) { hour in
                HStack(spacing: 12) {
                    Text(hour.time)
                        .font(.headline)
                        .frame(width: 60, alignment: .leading)

                    Image(systemName: WeatherAnimationType.from(code: hour.conditionCode, isDay: true).sfSymbolName)
                        .foregroundColor(.blue)

                    Text(hour.conditionText)
                        .font(.subheadline)

                    Spacer()

                    Text("\(Int(round(hour.temperature)))°")
                        .font(.headline)
                }
            }
            .navigationTitle(day.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}