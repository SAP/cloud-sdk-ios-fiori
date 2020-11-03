//
//  LineLineIndicatorView.swift
//  
//
//  Created by Xu, Sheng on 11/2/20.
//

import SwiftUI

struct LineLineIndicatorView: View {
    let height: CGFloat
    
    var body: some View {
        let selectionIndicatorColor: Color = .preferredColor(.primary2)
        
        return VStack(alignment: .center, spacing: 0) {
            SelectionAnchorShape()
                .rotation(Angle(degrees: 180))
                .fill(selectionIndicatorColor)
                .frame(width: 9, height: 4)
            
            LineShape(pos1: CGPoint(x: 4.5,
                                    y: 0),
                      pos2: CGPoint(x: 4.5,
                                    y: max(0, height - 8)))
                .stroke(selectionIndicatorColor, lineWidth: 1)

            SelectionAnchorShape()
                .fill(selectionIndicatorColor)
                .frame(width: 9, height: 4)
        }
    }
}

struct LineLineIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LineLineIndicatorView(height: 100)
            .frame(width: 9, height: 100)
    }
}
