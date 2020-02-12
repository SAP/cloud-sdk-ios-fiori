//
//  YAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct YAxisView: View {
    @EnvironmentObject var model: ChartModel
    
    let textColor = Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1))
    var rect: CGRect
    var chartWidth: CGFloat
    
    var body: some View {
        let minVal = CGFloat(model.ranges?[model.selectedSeriesIndex!].lowerBound ?? 0)
        let maxVal = CGFloat(model.ranges?[model.selectedSeriesIndex!].upperBound ?? 0)
        
        var yAxisTitlesCount = Int((rect.size.height - 40)/30)
        if yAxisTitlesCount < 0 {
            yAxisTitlesCount = 0
        }
        else if yAxisTitlesCount > 0 {
            yAxisTitlesCount = (yAxisTitlesCount / 2 > 0) ? (yAxisTitlesCount / 2) : 1
            if yAxisTitlesCount % 2 == 0 {
                yAxisTitlesCount -= 1
            }
        }
        
        let count = yAxisTitlesCount + 2
        var yAxisTitles: [AxisTitle] = [AxisTitle(index: 0, title: formatYAxisTitle(value: maxVal, total: count))]
        
        if yAxisTitlesCount > 0 {
            for i in 1...yAxisTitlesCount {
                let val = maxVal - CGFloat(i) * (maxVal - minVal) / CGFloat(yAxisTitlesCount + 1)
                yAxisTitles.append(AxisTitle(index: i,
                                             title: formatYAxisTitle(value: val, total: count)))
            }
        }
        yAxisTitles.append(AxisTitle(index: count - 1, title: formatYAxisTitle(value: minVal, total: count)))
        
        let strokeStyle = StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [2, 4], dashPhase: 0)
        
        let x = rect.origin.x + rect.size.width
        // y axis titles
        return ZStack {
            ForEach(yAxisTitles) { title in
                Text(title.title)
                    .font(.caption)
                    .foregroundColor(self.textColor)
                    .position(x: self.rect.origin.x + self.rect.size.width / 2,
                              y: self.rect.origin.y + CGFloat(title.index) * self.rect.size.height / CGFloat(yAxisTitles.count - 1))
            }
            
            // middle dash line
            LineShape(pos1: CGPoint(x: x, y: rect.size.height/2),
                      pos2: CGPoint(x: x + chartWidth, y: rect.size.height/2),
                      color: .init(red: 0.4210377932, green: 0.4355759025, blue: 0.448372364),
                      width: 1,
                      strokeStyle: strokeStyle)
            
            // bottom solid line
            LineShape(pos1: CGPoint(x: x, y: rect.size.height),
                      pos2: CGPoint(x: x + chartWidth, y: rect.size.height),
                      color: .init(red: 0.4210377932, green: 0.4355759025, blue: 0.448372364),
                      width: 2)
        }
    }
    
    func formatYAxisTitle(value: CGFloat, total: Int) -> String {
        let minVal = model.ranges?[model.selectedSeriesIndex!].lowerBound ?? 0
        let maxVal = model.ranges?[model.selectedSeriesIndex!].upperBound ?? 0
        let range = CGFloat(maxVal - minVal) / CGFloat(total)
        
        let dataPrecision = (range >= 1) ? "%.0f" : (minVal >= 0.1 ? "%.1f" : "%.2f")
        
        return String(format: dataPrecision, value)
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        YAxisView(rect: CGRect(x: 0, y: 0, width: 40, height: 200), chartWidth: 160).environmentObject(Tests.stockModels[1])
        .frame(width:300, height: 200, alignment: .topLeading)
        .padding()
        .previewLayout(.sizeThatFits)
        
    }
}
