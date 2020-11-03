//
//  LineRangeIndicatorView.swift
//  
//
//  Created by Xu, Sheng on 11/2/20.
//

import SwiftUI

struct LineRangeIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    
    let seriesIndex: Int
    let startIndex: Int
    let endIndex: Int
    let displayRange: ClosedRange<CGFloat>
    let baselinePosition: CGFloat
    let lineWidth: CGFloat
    let pointRadius: CGFloat
    let pointGap: CGFloat
    let lineFillColor: Color
    let lineStrokeColor: Color
    let pointStrokeColor: Color
    
    var body: some View {
        ZStack {
            LinesShape(model: model,
                         seriesIndex: seriesIndex,
                         categoryIndexRange: startIndex ... endIndex,
                         displayRange: displayRange,
                         layoutDirection: self.layoutDirection,
                         fill: true,
                         baselinePosition: baselinePosition,
                         startOffset: 0,
                         endOffset: 0)
                .fill(lineFillColor)
                .opacity(0.4)

            LinesShape(model: model,
                         seriesIndex: seriesIndex,
                         categoryIndexRange: startIndex ... endIndex,
                         displayRange: displayRange,
                         layoutDirection: layoutDirection,
                         startOffset: 0,
                         endOffset: 0)
                .stroke(lineStrokeColor,
                        lineWidth: lineWidth)
            
            PointsShape(model: model,
                          seriesIndex: seriesIndex,
                          categoryIndexRange: startIndex ... endIndex,
                          displayRange: displayRange,
                          layoutDirection: layoutDirection,
                          radius: pointRadius,
                          gap: pointGap,
                          startOffset: 0,
                          endOffset: 0)
                .fill(pointStrokeColor)
        }
    }
}
