//
//
// AppEnviroment.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import SwiftUI

struct AppEnviroment {
    let container: DIContainer
}

extension AppEnviroment {

    static func bootstrap() -> AppEnviroment {
        let session = configuredURLSession()
        let webRepo = configureWebRepositroy(session: session)
        let service = configreService(webRepositroy: webRepo)
        let diContainer = DIContainer(sevices: service)

        return AppEnviroment(container: diContainer)
    }

    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }

    private static func configureWebRepositroy(session: URLSession) -> DIContainer.WebRepositories {
        let placeWebRepository = DefaultPlacesWebRepository(
            session: session,
            baseURL: "https://api.foursquare.com/v3/places/"
        )

        return .init(placesWebRepository: placeWebRepository)
    }

    private static func configreService(webRepositroy: DIContainer.WebRepositories) -> DIContainer.Services {
        let placeService = DefaultPlacesService(placesWebRepository: webRepositroy.placesWebRepository)

        return .init(placeSercie: placeService)
    }
}


