//
//  ContentView.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
          MeshGradientBuilderView()
            .navigationTitle("MeshGradient Builder")
        }
    }
}

#Preview {
    ContentView()
}
