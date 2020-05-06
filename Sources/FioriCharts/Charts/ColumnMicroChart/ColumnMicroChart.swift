//
//  ColumnMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

public struct ColumnMicroChart: View {
    @ObservedObject var model: ChartModel
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    public var body: some View {
        GeometryReader { proxy in
            self.columnsView(in: proxy.size)
        }.padding(4)
    }
    
    func columnsView(in size: CGSize) -> some View {
        let (barWidth, barSpace) = columnWidthAndSpace(in: size)
        
        let dateLabelsHeight: CGFloat = 18
        var negativeLabelsHeight: CGFloat = 0
        if existNegativeValues() {
            negativeLabelsHeight = 16
        }
        let positiveLablesHeight: CGFloat = 16
        
        let wholeBarsHeight: CGFloat = size.height - dateLabelsHeight - negativeLabelsHeight - positiveLablesHeight
        
        var minVal: CGFloat = 0
        var valueRange: CGFloat = 1
        if let range = model.ranges.first {
            minVal = CGFloat(range.lowerBound > 0 ? 0 : range.lowerBound)
            valueRange = CGFloat(range.upperBound) - minVal
        }
        
        let negativeBarsHeight: CGFloat = minVal >= 0 ? 0 : wholeBarsHeight * abs(minVal) / valueRange
        let positiveBarsHeight: CGFloat = wholeBarsHeight - negativeBarsHeight
        let columns = model.dataItemsIn(seriesIndex: 0)
        
        return VStack(alignment: .center, spacing: 0) {
            if columns.isEmpty {
                NoDataView()
            } else {
                // positive value columns and their value column lables
                HStack(alignment: .bottom, spacing: barSpace) {
                    ForEach(columns) { item in
                        VStack(alignment: .center, spacing: 0) {
                            Spacer(minLength: 0)
                            
                            if positiveLablesHeight > 0 && self.columnLabel(for: item, positive: true) != nil {
                                Text(self.columnLabel(for: item, positive: true) ?? "")
                                    .lineLimit(1)
                                    .font(.caption)
                                    .foregroundColor(item.color.color(self.colorScheme))
                            }
                            
                            Rectangle()
                                .fill(item.color.color(self.colorScheme))
                                .frame(width: barWidth, height: wholeBarsHeight * abs(item.value) / valueRange)
                        }.frame(width: barWidth, height: positiveBarsHeight + positiveLablesHeight)
                    }
                }.frame(width: size.width, height: positiveBarsHeight + positiveLablesHeight)
                
                // negative value columns and their value column lables
                if self.existNegativeValues() {
                    HStack(alignment: .top, spacing: barSpace) {
                        ForEach(columns) { item in
                            VStack(alignment: .center, spacing: 0) {
                                Rectangle()
                                    .fill(item.value > 0 ? Color.clear : item.color.color(self.colorScheme))
                                    .frame(width: barWidth, height: wholeBarsHeight * abs(item.value) / valueRange)
                                
                                if negativeLabelsHeight > 0 && self.columnLabel(for: item, positive: false) != nil {
                                    Text(self.columnLabel(for: item, positive: false) ?? "")
                                        .lineLimit(1)
                                        .font(.caption)
                                        .foregroundColor(item.color.color(self.colorScheme))
                                }
                                
                                Spacer(minLength: 0)
                            }.frame(width: barWidth, height: negativeBarsHeight + negativeLabelsHeight)
                        }
                    }.frame(width: size.width, height: negativeBarsHeight + negativeLabelsHeight)
                }
                
                // date column lables
                if dateLabelsHeight > 0 {
                    HStack(alignment: .bottom, spacing: barSpace) {
                        ForEach(columns) { item in
                            Text(item.label ?? "")
                                .lineLimit(1)
                                .font(.caption)
                        }.frame(width: barWidth)
                    }
                }
            }
        }
    }
    
    func columnLabel(for item: MicroChartDataItem, positive: Bool) -> String? {
        if positive {
            return item.value >= 0 ? (item.displayValue): nil
        } else {
            return item.value < 0 ? (item.displayValue): nil
        }
    }
    
    func normalizedValue(for value: Double, range: CGFloat) -> CGFloat {
        return abs(CGFloat(value)) / range
    }
    
    func existNegativeValues() -> Bool {
        if let range = model.ranges.first {
            if range.lowerBound < 0 {
                return true
            }
        }
        
        return false
    }
    
    // n + (n-1) * 0.2 = n + (n - 1)/5 = (6n -1)/5
    func columnWidthAndSpace(in size: CGSize) -> (CGFloat, CGFloat) {
        let count = model.data[0].count
        var width = size.width * 5 / (CGFloat(6 * count) - 1)
        var space = width * 0.2
        if space < 2 {
            space = 2
        } else if space > 5 {
            space = 5
        } else {
            space = ceil(space)
        }
        width = (size.width - CGFloat((count - 1)) * space) / CGFloat(max(count, 1))
        
        return (width, space)
    }
}

struct ColumnMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.columnModels) {
                ColumnMicroChart($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
