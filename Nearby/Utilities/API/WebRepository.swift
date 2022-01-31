//
//
// WebRepository.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import Combine

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {

    @available(iOS 15.0.0, *)
    public func fetchData(endpoint: Route) async throws -> Results {
        let url = try endpoint.urlRequest(baseURL: baseURL)

        do {
            let (data, _) = try await URLSession.shared.data(for: url)
            let results = try JSONDecoder().decode(Results.self, from: data)
            return results
        } catch {
            throw error
        }
    }
}
