//
//  ColorMix.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/21/24.
//

import SwiftUI

struct ColorMixDemoView: View {
  @State private var base: Color = .green
  @State private var mixed: Color = .blue
  @State private var fraction: Double = 0.5
  @State private var colorSpace: Gradient.ColorSpace = .device
  
  var body: some View {
    VStack {
      controls
      base.mix(with: mixed, by: fraction, in: colorSpace)
        .ignoresSafeArea()
    }
  }
  
  var controls: some View {
    VStack(spacing: 20) {
      HStack {
        ColorPicker("Color 1", selection: $base)
          .fixedSize()
        Divider()
        ColorPicker("Color 2", selection: $mixed)
          .fixedSize()
      }
      .frame(height: 20)
      
      VStack {
        Text(String(format: "%.2f", arguments: [fraction]))
          .monospacedDigit()
        Slider(value: $fraction) {
          Text("Mix")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("1")
        }
      }
      
      Picker(selection: $colorSpace) {
        Text("Device")
          .tag(Gradient.ColorSpace.device)
        Text("Perceptual")
          .tag(Gradient.ColorSpace.perceptual)
      } label: {
        Text("ColorSpace")
      }
      .pickerStyle(SegmentedPickerStyle())
      
    }
    .padding(.horizontal)
  }
  
}

#Preview {
  ColorMixDemoView()
}
