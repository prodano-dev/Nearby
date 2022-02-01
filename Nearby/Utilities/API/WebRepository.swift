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
import UIKit

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {

    @available(iOS 15.0.0, *)
    public func fetchData(endpoint: Route, queryParams: String? = nil) async throws -> Results {
        let url = try endpoint.urlRequest(baseURL: baseURL, queryParams: queryParams)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: url)
            let results = try JSONDecoder().decode(Results.self, from: data)
            return results
        } catch {
            throw error
        }
    }

    public func fetchImageData(endpoint: Route) async throws -> PlacePhoto {
        let url = try endpoint.urlRequest(baseURL: baseURL)
        do {
            let (data, _) = try await URLSession.shared.data(for: url)
            let result = try JSONDecoder().decode([PlacePhoto].self, from: data)
            guard let photo = result.first else {
                return PlacePhoto(id: "", prefix: "", suffix: "")
            }
            return photo
        } catch {
            throw error
        }
    }

    public func fetchImage(imageURL: URL) async throws -> UIImage {

        do {
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            let image = UIImage(data: data)
            return image!
        } catch {
            throw error
        }
    }
}
