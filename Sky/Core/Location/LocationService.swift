//
//  LocationService.swift
//  Sky
//
//  Created by siam on 01/06/2026.
//

import CoreLocation
import Foundation


@MainActor
final class LocationService: NSObject {
    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocationCoordinate2D, Error>?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func currentCoordinate() async throws -> CLLocationCoordinate2D {
        let status = manager.authorizationStatus

        if status == .denied || status == .restricted {
            throw LocationServiceError.denied
        }

        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation

            if status == .notDetermined {
                manager.requestWhenInUseAuthorization()
            } else {
                manager.requestLocation()
            }
        }
    }

    private func finish(with result: Result<CLLocationCoordinate2D, Error>) {
        guard let continuation else { return }
        self.continuation = nil
        continuation.resume(with: result)
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied, .restricted:
            finish(with: .failure(LocationServiceError.denied))
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {
            finish(with: .failure(LocationServiceError.unavailable))
            return
        }

        finish(with: .success(coordinate))
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        finish(with: .failure(error))
    }
}
enum LocationServiceError: LocalizedError {
    case denied
    case unavailable

    var errorDescription: String? {
        switch self {
        case .denied:
            return "Location permission is required to show weather for your current place."
        case .unavailable:
            return "Could not get your current location."
        }
    }
}
