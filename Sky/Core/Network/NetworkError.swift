//
//  NetworkError.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case badResponse(statusCode: Int)
    case decodingFailed(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response from the server."
        case .badResponse(let statusCode):
            return "Server error: \(statusCode)."
        case .decodingFailed:
            return "Failed to parse response."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
