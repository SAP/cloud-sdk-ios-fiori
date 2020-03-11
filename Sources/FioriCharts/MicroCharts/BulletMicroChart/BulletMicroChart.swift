//
//  BulletMicroChart.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI
import Combine

public struct BulletMicroChart: View {
    enum Mode: CaseIterable {
        case standard, delta
    }
    
    @ObservedObject var model: ChartModel
    @State var mode: Mode? = .standard
    
    init(_ model: ChartModel) {
        self.model = model
    }
    
    public var body: some View {
        let tmp = model.dataItemsIn(seriesIndex: 0)
        let thresholds = model.dataItemsIn(seriesIndex: 1)
        
        return GeometryReader { proxy in
            ZStack(alignment: .leading) {
                if tmp.count == 0 || tmp.first == nil {
                    NoDataView()
                }
                else {
                    if thresholds.count > 0 {
                        // draw threshold lines
                        self.thresholdsView(size: proxy.size, thresholds: thresholds)
                    }
                    
                    // draw background rectangle
                    self.backgroundView(in: proxy.size)
                    
                    // draw forecast rectangle
                    self.forecastView(in: proxy.size)
                    
                    // draw actual rectangle
                    self.actualView(in: proxy.size)
                    
                    // draw target lines
                    self.targetView(in: proxy.size)
                }
            }
        }.padding(3)
    }
    
    func backgroundView(in size: CGSize) -> some View {
        let chartHeight = size.height * 0.786
        return Rectangle()
            .fill(Color.gray)
            .frame(width: size.width, height: chartHeight)
    }
    
    func forecastView(in size: CGSize) -> some View {
        let tmp = model.dataItemsIn(seriesIndex: 0)
        
        let forecastValue = tmp.count < 3 ? 0 : tmp[2].value
        let chartHeight = size.height * 0.786
        let width = model.normalizedValue(for: forecastValue) * size.width
        let height = chartHeight * 0.6
        
        return Rectangle()
            .fill(Color(red: 0, green: 0, blue: 1.0, opacity: 0.3))
            .frame(width: width, height: height)
        
    }
    
    func actualView(in size: CGSize) -> some View {
        let tmp = model.dataItemsIn(seriesIndex: 0)
        
        let actualValue = tmp.count < 1 ? 0 : tmp[0].value
        let targetValue = tmp.count < 2 ? 0 : tmp[1].value
        
        let chartHeight = size.height * 0.786
        var width = model.normalizedValue(for: actualValue) * size.width
        let height = chartHeight * 0.6 * 0.6
        var x: CGFloat = 0
        
        if mode == BulletMicroChart.Mode.delta {
            x = model.normalizedValue(for: targetValue) * size.width
            width -= x
        }
        
        let color: Color = actualValue > targetValue ?  .green : .red
        
        return Rectangle()
            .fill(color)
            .frame(width: width, height: height)
    }
    
    func targetView(in size: CGSize) -> some View {
        let tmp = model.dataItemsIn(seriesIndex: 0)
        
        let targetValue = tmp.count < 2 ? 0 : tmp[1].value
        let chartHeight = size.height * 0.786
        let y = (size.height - chartHeight) / 2
        let normalizedTargetValue = self.model.normalizedValue(for: targetValue)
        return ZStack {
            LineShape(pos1: CGPoint(x: normalizedTargetValue * size.width, y: y - 3),
                      pos2: CGPoint(x: normalizedTargetValue * size.width, y: y + chartHeight + 6))
                .stroke(Color.black,
                        style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [1, 1], dashPhase: 0))
            
            LineShape(pos1: CGPoint(x: normalizedTargetValue * size.width - 2, y: y - 3),
                      pos2: CGPoint(x: normalizedTargetValue * size.width - 2, y: y + chartHeight + 6))
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [1, 1], dashPhase: 0))
        }
    }
    
    
    
    func thresholdsView(size: CGSize, thresholds: [MicroChartDataItem]) -> some View {
        let chartHeight = size.height * 0.786
        let y = (size.height - chartHeight) / 2
        return ZStack {
            ForEach(thresholds) {
                LineShape(pos1: CGPoint(x: self.model.normalizedValue(for: $0.value) * size.width, y: y - 3),
                          pos2: CGPoint(x: self.model.normalizedValue(for: $0.value) * size.width, y: y + chartHeight + 6))
                    .stroke($0.color,
                            style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [1, 1], dashPhase: 0))
            }
        }
    }
}

struct BulletMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.bulletModles) {
                BulletMicroChart($0)
                    .frame(width: 320, height: 94)
            }
        }
        .previewLayout(.fixed(width: 320, height: 94))
    }
}

