//
//
// MainViewModel.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

extension ContentView {

    class ViewModel: NSObject, ObservableObject {

        let container: DIContainer
        @Published var resulys: [Place] = []

        init(container: DIContainer){
            self.container = container
        }

        @MainActor public func fetch() async {
            do {
                resulys = try await container
                    .services
                    .placesService
                    .fetchPlaces()
                    .results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
