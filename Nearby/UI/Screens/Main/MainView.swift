//
//
// MainView.swift
// Nearby
//
// Created by prodano.dev on 01/02/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import SwiftUI

struct MainView: View {
    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {

        if viewModel.locationAuthorization == .notDetermined {
            VStack {
                Text("Please enable location to see all venues nearby")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    didTappedButton()
                } label: {
                    Text("Enable Location")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.green.opacity(0.8))
                .cornerRadius(24)
            }
            .padding()
        } else {
            List(viewModel.resulys, id: \.id) { venue in
                PlaceCell(name: venue.name, distance: venue.distance)
            }
            .task {
                await viewModel.fetch()
            }
        }

    }

    private func didTappedButton() {
        viewModel.requestAuthorisation()
    }

}
