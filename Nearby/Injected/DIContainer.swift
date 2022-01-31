//
//
// DIContainer.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import SwiftUI

struct DIContainer: EnvironmentKey {

    let services: Services
    static var defaultValue: Self { self.defaultValue }

    init(sevices: DIContainer.Services) {
        self.services = sevices
    }
}

extension DIContainer {
    struct WebRepositories {
        let placesWebRepository: PlacesWebRepository
    }
}
