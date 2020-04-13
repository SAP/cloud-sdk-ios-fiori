//
//  LinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct LinesView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    @State var fill: Bool = false
    
    public init(_ chartModel: ChartModel, fill: Bool = false) {
        self.model = chartModel
        self.fill = fill
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.content(in: proxy.frame(in: .local))
        }
    }
    
    func content(in rect: CGRect) -> some View {
        let displayRange = ChartUtility.displayRange(model)
        var noData = false
        let width = rect.size.width
        let startPosIn = CGFloat(model.startPos)
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(ChartUtility.numOfDataItmes(model) - 1)
        let startIndex = Int(startPosIn / unitWidth)
        
        var endIndex = Int(((startPosIn + width) / unitWidth).rounded(.up))
        let startOffset: CGFloat = -startPosIn.truncatingRemainder(dividingBy: unitWidth)
        
        let endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosIn - width).truncatingRemainder(dividingBy: unitWidth)
        
        if endIndex > ChartUtility.lastValidDimIndex(model) {
            endIndex = ChartUtility.lastValidDimIndex(model)
        }
        
        if startIndex > endIndex {
            noData = true
        }
        
        var data: [[Double?]] = Array(repeating: [], count: model.data.count)
        if !noData {
            for (i, category) in model.data.enumerated() {
                var s: [Double?] = []
                for i in startIndex...endIndex {
                    if let val = category[i].first {
                        s.append(val)
                    }
                }
                data[i] = s
            }
        }
        
        var strokeColors: [Color] = []
        var fillColors: [Color] = []
        
        for i in 0 ..< data.count {
            let rgba = model.seriesAttributes[i].palette.colors[0].rgba(colorScheme)
            let strokeColor = Color(.sRGB, red: rgba.r, green: rgba.g, blue: rgba.b, opacity: rgba.a)
            let fillColor = Color(.sRGB, red: rgba.r, green: rgba.g, blue: rgba.b, opacity: rgba.a * 0.4)
            strokeColors.append(strokeColor)
            fillColors.append(fillColor)
        }
        
        return ZStack {
            model.backgroundColor.color(colorScheme)
            ForEach(0 ..< data.count) { i in
                LinesShape(points: data[i],
                           displayRange: displayRange,
                           layoutDirection: self.layoutDirection,
                           startOffset: startOffset,
                           endOffset: endOffset)
                    .stroke(strokeColors[i],
                            lineWidth: CGFloat(self.model.seriesAttributes[i].lineWidth))
                    .frame(width: rect.size.width, height: rect.size.height)
                    .clipped()
            }
            
            ForEach(0 ..< data.count) { i in
                PointsShape(points: data[i],
                            displayRange: displayRange,
                            layoutDirection: self.layoutDirection,
                            radius: self.pointRadius(at: i),
                            gap: CGFloat(self.model.seriesAttributes[i].point.gap),
                            startOffset: startOffset,
                            endOffset: endOffset)
                    .fill(self.model.seriesAttributes[i].point.strokeColor.color(self.colorScheme))
                    .clipShape(Rectangle()
                        .size(width: rect.size.width + self.pointRadius(at: i) * 2, height: rect.size.height)
                        .offset(x: -1 * self.pointRadius(at: i), y: 0))
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LinesView($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
