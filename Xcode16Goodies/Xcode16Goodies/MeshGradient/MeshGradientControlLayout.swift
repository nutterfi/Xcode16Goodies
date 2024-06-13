//
//  MeshGradientControlLayout.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/12/24.
//

import SwiftUI

struct MeshGradientControlLayout: Layout {
  @Binding var model: MeshGradientBuildModel
  
  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
    proposal.replacingUnspecifiedDimensions()
  }
  
  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    for (index, subview) in subviews.enumerated() {
      let relativePoint = model.points[index]
      
      let dimensions = subview.dimensions(in: proposal)
      let subProposal = ProposedViewSize(width: dimensions.width, height: dimensions.height)
      
      subview.place(at: CGPoint(x: bounds.minX + bounds.width * CGFloat(relativePoint.x), y: bounds.minY + bounds.height * CGFloat(relativePoint.y)), anchor: .center, proposal: proposal)
    }
  }
  
  
}

