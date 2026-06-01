//
//  NetworkClientProtocol.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

protocol NetworkClientProtocol {
    func request<T: Decodable>(
        endpoint: String,
        params: [String: String]
    ) async throws -> T
}
