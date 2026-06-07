//
//  LocalCitiesData.swift
//  Sky
//
//  Created by siam on 02/06/2026.
//

import Foundation

struct LocalCity: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let lat: Double
    let lon: Double
}

struct LocalCitiesData {
    static let all: [LocalCity] = [
        // Egypt
        LocalCity(name: "Cairo",          country: "Egypt",          lat: 30.0444,  lon: 31.2357),
        LocalCity(name: "Alexandria",     country: "Egypt",          lat: 31.2001,  lon: 29.9187),
        LocalCity(name: "Giza",           country: "Egypt",          lat: 30.0131,  lon: 31.2089),
        LocalCity(name: "Luxor",          country: "Egypt",          lat: 25.6872,  lon: 32.6396),
        LocalCity(name: "Aswan",          country: "Egypt",          lat: 24.0889,  lon: 32.8998),
        LocalCity(name: "Sharm El-Sheikh",country: "Egypt",          lat: 27.9158,  lon: 34.3300),
        LocalCity(name: "Hurghada",       country: "Egypt",          lat: 27.2574,  lon: 33.8129),
        // Saudi Arabia
        LocalCity(name: "Riyadh",         country: "Saudi Arabia",   lat: 24.7136,  lon: 46.6753),
        LocalCity(name: "Jeddah",         country: "Saudi Arabia",   lat: 21.5433,  lon: 39.1728),
        LocalCity(name: "Mecca",          country: "Saudi Arabia",   lat: 21.3891,  lon: 39.8579),
        LocalCity(name: "Medina",         country: "Saudi Arabia",   lat: 24.5247,  lon: 39.5692),
        // UAE
        LocalCity(name: "Dubai",          country: "UAE",            lat: 25.2048,  lon: 55.2708),
        LocalCity(name: "Abu Dhabi",      country: "UAE",            lat: 24.4539,  lon: 54.3773),
        // Global
        LocalCity(name: "London",         country: "UK",             lat: 51.5074,  lon: -0.1278),
        LocalCity(name: "Paris",          country: "France",         lat: 48.8566,  lon: 2.3522),
        LocalCity(name: "New York",       country: "USA",            lat: 40.7128,  lon: -74.0060),
        LocalCity(name: "Los Angeles",    country: "USA",            lat: 34.0522,  lon: -118.2437),
        LocalCity(name: "Tokyo",          country: "Japan",          lat: 35.6762,  lon: 139.6503),
        LocalCity(name: "Istanbul",       country: "Turkey",         lat: 41.0082,  lon: 28.9784),
        LocalCity(name: "Berlin",         country: "Germany",        lat: 52.5200,  lon: 13.4050),
        LocalCity(name: "Rome",           country: "Italy",          lat: 41.9028,  lon: 12.4964),
        LocalCity(name: "Madrid",         country: "Spain",          lat: 40.4168,  lon: -3.7038),
        LocalCity(name: "Toronto",        country: "Canada",         lat: 43.6532,  lon: -79.3832),
        LocalCity(name: "Sydney",         country: "Australia",      lat: -33.8688, lon: 151.2093),
        LocalCity(name: "Singapore",      country: "Singapore",      lat: 1.3521,   lon: 103.8198),
        LocalCity(name: "Mumbai",         country: "India",          lat: 19.0760,  lon: 72.8777),
        LocalCity(name: "Beijing",        country: "China",          lat: 39.9042,  lon: 116.4074),
        LocalCity(name: "Moscow",         country: "Russia",         lat: 55.7558,  lon: 37.6173),
        LocalCity(name: "Lagos",          country: "Nigeria",        lat: 6.5244,   lon: 3.3792),
        LocalCity(name: "Nairobi",        country: "Kenya",          lat: -1.2921,  lon: 36.8219),
    ]
}
