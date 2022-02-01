//
//
// PlacesService.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import Combine

protocol PlacesService {
    func fetchPlaces(queryParams: String) async throws -> Results
    func fetchPhotoDetails(id: String) async throws -> PlacePhoto
}

struct DefaultPlacesService: PlacesService {

    let placesWebRepository: PlacesWebRepository

    init(placesWebRepository: PlacesWebRepository) {
        self.placesWebRepository = placesWebRepository
    }

    func fetchPlaces(queryParams: String) async throws -> Results {
        return try await placesWebRepository.fetchPlacesNearby(queryParams: queryParams)
    }

    func fetchPhotoDetails(id: String) async throws -> PlacePhoto {
        return try await placesWebRepository.fetchPhotoDetails(id: id)
    }
}
