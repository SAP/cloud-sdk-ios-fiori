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
    
    @EnvironmentObject var model: BulletMicroChartModel
    @State var mode: Mode? = .standard

    
    public var body: some View {
        if model.actual == nil {
            return AnyView(
                NoDataView()
            )
        } else {
            return AnyView(
                GeometryReader { proxy in
                    ZStack {
                        // draw threshold lines
                        self.thresholdsView(in: proxy.size)
                        
                        // draw background rectangle
                        self.backgroundView(in: proxy.size)
                        
                        // draw forecast rectangle
                        self.forecastView(in: proxy.size)
                        
                        // draw actual rectangle
                        self.actualView(in: proxy.size)
                        
                        // draw target lines
                        self.targetView(in: proxy.size)
                
                    }
                }.padding(3)
            )
        }
    }
    
    func backgroundView(in size: CGSize) -> some View {
        let chartHeight = size.height * 0.786
        return BarShape(origin: CGPoint(x: 0, y: (size.height - chartHeight)/2.0), size: CGSize(width: size.width, height: chartHeight), color: .gray)
    }
    
    func forecastView(in size: CGSize) -> some View {
        guard let forecastValue = model.forecastValue else { return EmptyView.any }
        let chartHeight = size.height * 0.786
        let width = model.normalizedValue(for: forecastValue) * size.width
        let height = chartHeight * 0.6
        
        return AnyView(BarShape(origin: CGPoint(x: 0, y: (size.height - height)/2.0),
                                size: CGSize(width: width, height: height),
                                color: .init(red: 0, green: 0, blue: 1.0, opacity: 0.3)))
                                //color: .blue.withAlphaComponent(0.3)))
    }
    
    func actualView(in size: CGSize) -> some View {
        guard let actualValue = model.actual?.value else { return EmptyView.any }
        let targetValue = (model.targetValue == nil) ? 0 : model.targetValue!
        
        let chartHeight = size.height * 0.786
        var width = model.normalizedValue(for: actualValue) * size.width
        let height = chartHeight * 0.6 * 0.6
        var x: CGFloat = 0

        if mode == BulletMicroChart.Mode.delta {
            x = model.normalizedValue(for: targetValue) * size.width
            width -= x
        }
        
        let color = actualValue > targetValue ? (model.actual!.color ?? .green) : .red
        
        return AnyView(BarShape(origin: CGPoint(x: x, y: (size.height - height)/2.0), size: CGSize(width: width, height: height), color: color))
    }
    
    func thresholdsView(in size: CGSize) -> some View {
        guard !model.thresholds.isEmpty else { return EmptyView.any }
        let chartHeight = size.height * 0.786
        let y = (size.height - chartHeight) / 2
        return AnyView(
            ZStack {
                ForEach(model.thresholds) {
                    LineShape(pos1: CGPoint(x: self.model.normalizedValue(for: $0.value) * size.width, y: y - 3),
                                   pos2: CGPoint(x:self.model.normalizedValue(for: $0.value) * size.width, y: y + chartHeight + 6),
                                   color: $0.color,
                                   width: 3)
                    
                }
            }
        )
    }
    
    func targetView(in size: CGSize) -> some View {
        guard let targetValue = model.targetValue else { return EmptyView.any }
        
        let chartHeight = size.height * 0.786
        let y = (size.height - chartHeight) / 2
        return AnyView(
            ZStack {
                LineShape(pos1: CGPoint(x: self.model.normalizedValue(for: targetValue) * size.width, y: y - 3),
                               pos2: CGPoint(x:self.model.normalizedValue(for: targetValue) * size.width, y: y + chartHeight + 6),
                               color: .black,
                               width: 3)
                
                LineShape(pos1: CGPoint(x: self.model.normalizedValue(for: targetValue) * size.width - 2, y: y - 3),
                               pos2: CGPoint(x:self.model.normalizedValue(for: targetValue) * size.width - 2, y: y + chartHeight + 6),
                               color: .white,
                               width: 2)
            }
        )
    }
}

struct BulletMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BulletMicroChart()
                .environmentObject(BulletMicroChartModel.allCases.first!)
                .frame(width: 320, height: 94, alignment: .topLeading)
        
            BulletMicroChart(mode: .delta)
                .environmentObject(BulletMicroChartModel.allCases.first!)
                .frame(width: 320, height: 94, alignment: .topLeading)
        }
        .previewLayout(.fixed(width: 320, height: 94))
    }
}

