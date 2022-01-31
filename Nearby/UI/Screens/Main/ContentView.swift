//
//
// ContentView.swift
// Nearby
//
// Created by prodano.dev on 31/01/2022
// Copyright © 2022 prodano.dev. All rights reserved.
//
        

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onTapGesture {
                foo()
            }
            .task {
                await viewModel.fetch()
            }
    }

    func foo() {
        print(viewModel.resulys)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(container: .defaultValue))
    }
}
