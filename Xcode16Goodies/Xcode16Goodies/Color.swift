//
//  Color.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//

import SwiftUI

extension Color {
  static var random: Color {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return Color(red: r, green: g, blue: b)
  }
}
