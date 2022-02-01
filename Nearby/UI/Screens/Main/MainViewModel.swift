//
//
// MainViewModel.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation
import CoreLocation
import SwiftUI

extension MainView {

    class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

        let container: DIContainer
        @Published var resulys: [Place] = []
        @Published var photoUrls: [String: URL] = [:]
        private let locationManager = CLLocationManager()
        @Published var locationAuthorization: CLAuthorizationStatus = .notDetermined

        init(container: DIContainer){
            self.container = container
            super.init()
            locationManager.delegate = self
        }

        public func giveLocation() -> String {
            guard let userLocation = locationManager.location?.coordinate
            else { return ""}
            let long = String(userLocation.longitude)
            let lat = String(userLocation.latitude)
            return "\(lat),\(long)"
        }

        public func requestAuthorisation() {
            locationManager.requestWhenInUseAuthorization()
        }

        public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
                case .authorizedWhenInUse:
                    locationManager.startUpdatingLocation()
                    locationAuthorization = .authorizedWhenInUse
                case .authorizedAlways:
                    locationManager.startUpdatingLocation()
                default:
                    break
                }
        }

        @MainActor public func fetch() async {
            do {
                resulys = try await container
                    .services
                    .placesService
                    .fetchPlaces(queryParams: giveLocation())
                    .results

            } catch {
                print(error.localizedDescription)
            }

            for venue in resulys {
                do {
                    photoUrls[venue.id] = try await container
                    .services
                    .placesService
                    .fetchPhotoDetails(id: venue.id)
                    .imageURL
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
