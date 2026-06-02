//
//  ForecastCard.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct ForecastCard: View {
    let viewModel: HomeViewModel
    @State private var selectedDay: ForecastDayEntity?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("3-DAY FORECAST")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(viewModel.currentAnimation.textColor.opacity(0.6))
                .padding(.horizontal, 16)
                .padding(.top, 12)

            Divider()
                .background(viewModel.currentAnimation.textColor.opacity(0.3))

            ForEach(viewModel.weather?.forecastDays ?? []) { day in
                Button {
                    selectedDay = day
                } label: {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(day.title)
                                .font(.headline)
                            Text(day.conditionText)
                                .font(.caption)
                                .opacity(0.75)
                        }

                        Spacer()

                        Image(systemName: WeatherAnimationType.from(code: day.conditionCode, isDay: true).sfSymbolName)
                            .font(.title3)

                        Text("\(Int(round(day.minTemp)))° / \(Int(round(day.maxTemp)))°")
                            .font(.headline)
                            .frame(width: 80, alignment: .trailing)
                    }
                    .foregroundColor(viewModel.currentAnimation.textColor)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
        }
        .padding(.bottom, 12)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(.horizontal, 16)
        .sheet(item: $selectedDay) { day in
            HourlyForecastView(day: day)
        }
    }
}

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
