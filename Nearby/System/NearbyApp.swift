//
//
// NearbyApp.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import SwiftUI

@main
struct NearbyApp: App {
    let enviroment = AppEnviroment.bootstrap()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(container: enviroment.container))
        }
    }
}
