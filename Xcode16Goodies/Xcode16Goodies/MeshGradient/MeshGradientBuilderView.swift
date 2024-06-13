//
//  MeshGradientBuilderView.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//

import SwiftUI

struct MeshGradientBuilderView: View {
  @State var model = MeshGradientBuildModel()
  @State var shouldShowColorPickers = true
  var body: some View {
    VStack {
      controls
      MeshGradient(
        width: model.columns,
        height: model.rows,
        points: model.points,
        colors: model.colors.map {$0.color}
      )
      .overlay(
        Group {
          if shouldShowColorPickers {
            MeshGradientControlLayout(model: $model) {
              ForEach($model.colors) { index in
                ColorPicker(selection: index.color) {
                  EmptyView()
                }
                .fixedSize()
              }
            }
          } else {
            EmptyView()
          }
        }
      )
      .padding()
    }
  }
  
  @ViewBuilder
  var controls: some View {
    VStack {
      VStack {
        Toggle(isOn: $shouldShowColorPickers) {
          Text("Show Color Pickers")
        }
        
        Stepper(value: $model.rows) {
          Text("Rows: \(model.rows)")
        }
        
        Stepper(value: $model.columns) {
          Text("Columns: \(model.columns)")
        }
      }
    }
    .padding()
  }
}

#Preview {
    MeshGradientBuilderView()
}
