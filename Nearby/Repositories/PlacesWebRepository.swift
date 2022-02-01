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
    func fetchPlacesNearby(queryParams: String) async throws -> Results
    func fetchPhotoDetails(id: String) async throws -> PlacePhoto
}

struct DefaultPlacesWebRepository: PlacesWebRepository {

    let session: URLSession
    let baseURL: String

    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }

    func fetchPlacesNearby(queryParams: String) async throws -> Results {

        let route = Route(
            method: .Get,
            path: Path.Nearby.nearby,

            
            headers: [
                "Accept": "application/json",
                "Authorization": Secrets.API_KEY
            ]
            
        )

        return try await fetchData(endpoint: route, queryParams: queryParams)
    }

    func fetchPhotoDetails(id: String) async throws -> PlacePhoto {

        let rout = Route(
            method: .Get,
            path: Path.Photos.placeID(id: id),
            headers: [
                "Accept": "application/json",
                "Authorization": Secrets.API_KEY
            ])
        return try await fetchImageData(endpoint: rout)
    }


}
