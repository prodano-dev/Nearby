//
//
// PlaceCell.swift
// Nearby
//
// Created by prodano.dev on 01/02/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import SwiftUI

struct PlaceCell: View {
    let name: String
    let distance: Int
    var body: some View {
        HStack {
            Image(systemName: "location.square")
                .resizable()
                .frame(width: 82, height: 82)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                Text("\(distance) feet removed")
            }
            Spacer()
        }
        .padding()
    }
}
