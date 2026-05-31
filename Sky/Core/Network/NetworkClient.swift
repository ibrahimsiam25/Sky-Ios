//
//  NetworkClient.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import Foundation

final class NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    private let interceptor: NetworkInterceptor
    private let decoder: JSONDecoder
    private let baseURL = "https://api.weatherapi.com/v1/current.json"
    init(
        session: URLSession,
        interceptor: NetworkInterceptor,
        decoder: JSONDecoder
    ) {
        self.session = session
        self.interceptor = interceptor
        self.decoder = decoder
    }

    func request<T: Decodable>(
        params: [String: String]
    ) async throws -> T {
        let url = try buildURL(baseURL: baseURL, params: params)
        interceptor.logRequest(url: url)

        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            interceptor.logResponse(
                url: url,
                statusCode: httpResponse.statusCode,
                data: data
            )

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.badResponse(statusCode: httpResponse.statusCode)
            }

            do{
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }
        } catch let error as NetworkError {
            interceptor.logError(url: url, error: error)
            throw error
        } catch {
            interceptor.logError(url: url, error: error)
            throw NetworkError.unknown(error)
        }
    }

    private func buildURL(baseURL: String, params: [String: String]) throws -> URL {
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        return url
    }
}
