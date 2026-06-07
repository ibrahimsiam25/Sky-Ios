//
//  LocalCitiesService.swift
//  Sky
//
//  Created by siam on 07/06/2026.
//

import Foundation

class LocalCitiesService: LocalCitiesServiceProtocol {
    func getLocalCities() -> [LocalCity] {
        LocalCitiesData.all
    }
}
