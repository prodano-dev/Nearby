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
    func fetchPlaces() async throws -> Results
}

struct DefaultPlacesService: PlacesService {

    let placesWebRepository: PlacesWebRepository

    init(placesWebRepository: PlacesWebRepository) {
        self.placesWebRepository = placesWebRepository
    }

    func fetchPlaces() async throws -> Results {
        return try await placesWebRepository.fetchPlacesNearby()
    }
}
