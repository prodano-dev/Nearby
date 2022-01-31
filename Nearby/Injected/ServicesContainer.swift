//
//
// ServicesContainer.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

extension DIContainer {

    struct Services {

        let placesService: PlacesService

        init(placeSercie: PlacesService) {
            self.placesService = placeSercie
        }
    }
}
