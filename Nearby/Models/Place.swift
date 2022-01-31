//
//
// Place.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

struct Place: Decodable {

    let id: String
    let name: String
    let longitude: Double
    let latitude: Double
    let distance: Int
    let categorie: [Categories]

    enum CodingKeys: String, CodingKey {
        case id = "fsq_id"
        case name = "name"
        case distance = "distance"
        case categorie = "categories"
        case geocodes = "geocodes"
    }

    enum MainCodingKeys: String, CodingKey {
        case main = "main"
    }

    enum LatitudeKeys: String, CodingKey {
        case latitude = "latitude"
    }
    enum LongitudeKeys: String, CodingKey {
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey:  .id)
        name = try container.decode(String.self, forKey: .name)
        distance = try container.decode(Int.self, forKey: .distance)
        categorie = try container.decode([Categories].self, forKey: .categorie)

        //let container = try decoder.container(keyedBy: CodingKeys.self)

//        let prefixContainer = try container.nestedContainer(
//            keyedBy: ImageURLKeys.self,
//            forKey: .icon
//        )
//        let suffixContainer = try container.nestedContainer(
//            keyedBy: ImageSuffixKeys.self,
//            forKey: .icon
//        )

        let mainContainer = try container.nestedContainer(
            keyedBy: MainCodingKeys.self,
            forKey: .geocodes
        )

        let longContainer = try mainContainer.nestedContainer(
            keyedBy: LongitudeKeys.self,
            forKey: .main
        )
        longitude = try longContainer.decode(Double.self, forKey: .longitude)

        let langContainer = try mainContainer.nestedContainer(
            keyedBy: LatitudeKeys.self,
            forKey: .main
        )
        latitude = try langContainer.decode(Double.self, forKey: .latitude)
    }


}

struct Categories: Decodable {

    let id: Int
    let name: String
    let imageUrl: String
    let imageSuffix: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"

    }

    enum ImageURLKeys: String, CodingKey {
        case imageUrl = "prefix"
    }

    enum ImageSuffixKeys: String, CodingKey {
        case imageSuffix = "suffix"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)

        let prefixContainer = try container.nestedContainer(
            keyedBy: ImageURLKeys.self,
            forKey: .icon
        )
        let suffixContainer = try container.nestedContainer(
            keyedBy: ImageSuffixKeys.self,
            forKey: .icon
        )

        imageUrl = try prefixContainer.decode(String.self, forKey: .imageUrl)
        imageSuffix = try suffixContainer.decode(String.self, forKey: .imageSuffix)
    }

}

struct Results: Decodable {
    let results: [Place]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
