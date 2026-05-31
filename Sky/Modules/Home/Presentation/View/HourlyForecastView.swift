//
//  HourlyForecastView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI

struct HourlyForecastView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.1, green: 0.2, blue: 0.45), Color(red: 0.2, green: 0.4, blue: 0.65)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.white)
                
                Text("Hourly Forecast")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Upgrade to /forecast.json API endpoint to display real hourly data.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.horizontal, 40)
            }
        }
    }
}
