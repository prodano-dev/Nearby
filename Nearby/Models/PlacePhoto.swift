//
//
// PlacePhoto.swift
// Nearby
//
// Created by prodano.dev on 01/02/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

struct PlacePhoto: Decodable {
    let id: String
    let prefix: String
    let suffix: String

    var imageURL: URL {
        return URL(string: prefix + "200x200" + suffix)!
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case prefix = "prefix"
        case suffix = "suffix"
    }
}

struct PhotoArar: Decodable {

    let results: [PlacePhoto]

}
