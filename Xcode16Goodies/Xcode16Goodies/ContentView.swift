//
//  ContentView.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//

import SwiftUI


enum WWDC2024Feature: Identifiable, CaseIterable {
  case meshGradient
  case timeDataSource
  case colorMix
  
  var id: String {
    name
  }
  
  var name: String {
    switch self {
    case .meshGradient:
      "MeshGradient"
    case .timeDataSource:
      "TimeDataSource"
    case .colorMix:
      "Color Mix"
    }
  }
}

extension WWDC2024Feature: View {
  var body: some View {
    switch self {
    case .meshGradient:
      MeshGradientBuilderView()
    case .timeDataSource:
      TimeDataSourceExamplesView()
    case .colorMix:
      ColorMixDemoView()
    }
  }
  
  var navigationTitle: String {
    switch self {
    case .meshGradient:
      "MeshGradient Builder"
    case .timeDataSource:
      "TimeDataSource"
    case .colorMix:
      "Color.mix()"
    }
  }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
          List {
            ForEach(WWDC2024Feature.allCases) { feature in
              NavigationLink(value: feature) {
                Text(feature.name)
//                  .navigationTitle(feature.name)
                  .navigationBarTitleDisplayMode(.inline)
              }
            }
          }
          .navigationDestination(for: WWDC2024Feature.self, destination: { $0 })
          .navigationTitle("WWDC 2024 Features")
        }
    }
}

#Preview {
    ContentView()
}
