//
//  NetworkInterceptor.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import Foundation

struct NetworkInterceptor {
    func logRequest(url: URL) {
        print("--------------------------------------")
        print("REQUEST")
        print("URL: \(redacted(url))")
        print("--------------------------------------")
    }

    func logResponse(url: URL, statusCode: Int, data: Data) {
        let body = String(data: data, encoding: .utf8) ?? "nil"
        print("--------------------------------------")
        print("RESPONSE")
        print("URL: \(redacted(url))")
        print("Status: \(statusCode)")
        print("Body: \(body)")
        print("--------------------------------------")
    }

    func logError(url: URL, error: Error) {
        print("--------------------------------------")
        print("ERROR")
        print("URL: \(redacted(url))")
        print("Error: \(error.localizedDescription)")
        print("--------------------------------------")
    }

    private func redacted(_ url: URL) -> String {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return url.absoluteString
        }
        components.queryItems = components.queryItems?.map {
            URLQueryItem(name: $0.name, value: $0.name == "key" ? "****" : $0.value)
        }
        return components.url?.absoluteString ?? url.absoluteString
    }
}
