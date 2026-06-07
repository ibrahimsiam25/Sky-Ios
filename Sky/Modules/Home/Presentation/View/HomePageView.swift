//
//  HomePageView.swift
//  Sky
//
//  Created by siam on 05/06/2026.
//

import SwiftUI

struct PagePermissionView: View {
    let viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "location.slash")
                .font(.system(size: 64))
                .foregroundColor(.white)

            Text("Location Required")
                .font(.title2).fontWeight(.bold).foregroundColor(.white)

            Text(viewModel.errorMessage ?? "Please allow location access to show your weather.")
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            HStack(spacing: 12) {
                Button(action: openSettings) {
                    Text("Open Settings")
                        .fontWeight(.semibold).foregroundColor(.blue)
                        .padding(.horizontal, 20).padding(.vertical, 12)
                        .background(Color.white).cornerRadius(8)
                }
                Button(action: { Task { await viewModel.loadWeather() } }) {
                    Text("Retry")
                        .fontWeight(.semibold).foregroundColor(.white)
                        .padding(.horizontal, 20).padding(.vertical, 12)
                        .background(Color.white.opacity(0.2)).cornerRadius(8)
                }
            }
        }
    }

    private func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }
}


struct PageErrorView: View {
    let message: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 64)).foregroundColor(.white)

            Text("Something Went Wrong")
                .font(.title2).fontWeight(.bold).foregroundColor(.white)

            Text(message)
                .font(.body).foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center).padding(.horizontal, 32)

            Button(action: onRetry) {
                Text("Retry")
                    .fontWeight(.semibold).foregroundColor(.blue)
                    .padding(.horizontal, 24).padding(.vertical, 12)
                    .background(Color.white).cornerRadius(8)
            }
        }
    }
}



struct PageLoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack(spacing: 12) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                Text("Fetching Weather…")
                    .foregroundColor(.white).font(.subheadline)
            }
            .padding(24)
            .background(.ultraThinMaterial)
            .cornerRadius(16)
        }
    }
}
