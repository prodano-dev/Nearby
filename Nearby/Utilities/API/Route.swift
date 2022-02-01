//
//
// Route.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

public class Route {

    enum HTTPMethod: String {
        case Get = "GET"
    }

    enum Body {
        case none
        case dictonary([String: Any])
    }

    let method: HTTPMethod
    let path: String
    let headers: [String: String]
    var body: Body = .none

    init(method: HTTPMethod, path: String, headers: [String: String]) {
        self.method = method
        self.path = path
        self.headers = headers
    }

    public func urlRequest(baseURL: String, queryParams: String? = nil) -> URLRequest {
        let url = URL(string: baseURL + path)
        var urlComponent = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        /// TODO:  add long and lat from user location.
        if queryParams != nil {
            urlComponent?.queryItems = [ URLQueryItem(name: "ll", value: queryParams)]
        }
        var request = URLRequest(url: urlComponent!.url!)
        request.allHTTPHeaderFields = headers
        return request
    }
}
