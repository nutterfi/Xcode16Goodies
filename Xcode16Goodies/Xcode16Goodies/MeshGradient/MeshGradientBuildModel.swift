//
//  MeshGradientBuildModel.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//
import SwiftUI

import Observation

@Observable
class MeshGradientBuildModel {
  var rows: Int = 3 {
    didSet {
      generatePoints()
      generateColors()
    }
  }
  var columns: Int = 4 {
    didSet {
      generatePoints()
      generateColors()
    }
  }
  
  var points: [SIMD2<Float>] = []
  
  struct IdentifiableColor: Identifiable, Hashable {
    var id = UUID()
    var color: Color
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
  }
  
  
  var colors: [IdentifiableColor] = []
  
  init() {
    generatePoints()
    generateColors()
  }
  
  func generateColors() {
    colors = (0..<points.count).map { _ in
      IdentifiableColor(color: .random)
    }
  }
  
  func generatePoints() {
    let yStride: StrideThrough<Float> = stride(from: 0.0, through: 1.0, by: 1.0 / Float(rows - 1))
    let xStride: StrideThrough<Float> = stride(from: 0.0, through: 1.0, by: 1.0 / Float(columns - 1))
    
    var points = [SIMD2<Float>]()
    
    for y in yStride {
      for x in xStride {
        let point: SIMD2<Float> = .init(x, y)
        points.append(point)
      }
    }
    self.points = points
  }

}
