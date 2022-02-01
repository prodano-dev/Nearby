//
//
// Path.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import Foundation

enum Path {

    enum Nearby {
        static var nearby: String {
            return "nearby"
        }
    }

    enum Photos {
        static func placeID(id: String) -> String {
            return "\(id)/photos?limit=1"
        }
    }
}
