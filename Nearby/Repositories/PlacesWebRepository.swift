//
//
// PlacesWebRepository.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import Combine

protocol PlacesWebRepository: WebRepository {
    func fetchPlacesNearby() async throws -> Results
}

struct DefaultPlacesWebRepository: PlacesWebRepository {

    let session: URLSession
    let baseURL: String

    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }

    func fetchPlacesNearby() async throws -> Results {

        let route = Route(
            method: .Get,
            path: Path.Nearby.nearby,

            ///TODO: Add key !!
            headers: [
                "Accept": "application/json",
                "Authorization": Secrets.API_KEY
            ]
            
        )

        return try await fetchData(endpoint: route)
    }


}
