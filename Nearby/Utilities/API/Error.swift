//
//
// Error.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

enum APIError: Error, LocalizedError {

    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case genericError
    case other(Error)

    var localizedMessage: String {

        switch self {
        case .urlError(let error):
            return error.localizedDescription
        case .responseError(let status):
            return "bad response: \(status)"
        case .decodingError(let error):
            return error.localizedDescription
        case .genericError:
            return "Unkown error, please check later"
        case .other(let error):
            return "see error \(error.localizedDescription)"
        }
    }

    static func map(_ error: Error) -> APIError {
      return (error as? APIError) ?? .other(error)
    }
}
