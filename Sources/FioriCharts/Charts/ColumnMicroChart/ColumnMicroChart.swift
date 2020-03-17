//
//  ColumnMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI
import UIKit

public struct ColumnMicroChart: View {
    @ObservedObject var model: ChartModel
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    
    let topBottomLabelsFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
    let columnLabelsFont: UIFont = UIFont.preferredFont(forTextStyle: .caption1)
    let dateLabelsFont: UIFont = UIFont.preferredFont(forTextStyle: .caption1)
    
    let minHeightToShowLabels: CGFloat = 60
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
        
        // reset ranges' lower bound to 0
        if let ranges = model.ranges {
            for i in 0 ..< ranges.count {
                let range = ranges[i]
                
                let minVal = range.lowerBound > 0 ? 0 : range.lowerBound
                model.ranges![i] = minVal...range.upperBound
            }
        }
    }
    
    
    public var body: some View {
        GeometryReader { proxy in
            self.columnsView(in: proxy.size)
        }.padding(4)
    }
    
    func columnsView(in size: CGSize) -> some View {
        let (barWidth, barSpace) = columnWidthAndSpace(in: size)
        let (wholeBarsHeight, positiveBarsHeight, negativeBarsHeight, positiveLablesHeight, negativeLabelsHeight, dateLabelsHeight, _, _) = calChartComponentsHeight(in: size, barWidth: barWidth)
        let columns = model.dataItemsIn(seriesIndex: 0)
        
        return
            VStack(alignment: .center, spacing: 0) {
                /*if topLabelsHeight > 0 {
                    HStack {
                        Text(self.model.leftTopLabel?.label ?? "")
                            .foregroundColor(self.model.leftTopLabel?.color ?? .black)
                            .font(self.fontFromUIFont(self.topBottomLabelsFont))
                        
                        Spacer(minLength: 0)
                        
                        Text(self.model.rightTopLabel?.label ?? "")
                            .foregroundColor(self.model.rightTopLabel?.color ?? .black)
                            .font(self.fontFromUIFont(self.topBottomLabelsFont))
                    }
                }*/
                // positive value columns and their value column lables
                HStack(alignment: .bottom, spacing: barSpace) {
                    ForEach(columns) { item in
                        VStack(alignment: .center, spacing: 0) {
                            Spacer(minLength: 0)
                            
                            if positiveLablesHeight > 0 && self.columnLabel(for: item, positive: true) != nil {
                                Text(self.columnLabel(for: item, positive: true) ?? "")
                                    .font(.caption)
                                    .foregroundColor(item.color.color(self.colorScheme))
                            }

                            Rectangle()
                                .fill(item.color.color(self.colorScheme))
                                .frame(width: barWidth, height: item.value > 0 ? (CGFloat(self.model.normalizedValue(for: Double(item.value), seriesIndex: 0)) * wholeBarsHeight) : 0)
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
                                    .frame(width: barWidth, height: CGFloat(self.model.normalizedValue(for: Double(item.value), seriesIndex: 0)) * wholeBarsHeight)
                                
                                if negativeLabelsHeight > 0 && self.columnLabel(for: item, positive: false) != nil {
                                    Text(self.columnLabel(for: item, positive: false) ?? "")
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
                                .font(.caption)
                        }.frame(width: barWidth)
                    }
                }
                
                /*if bottomLabelsHeight > 0 {
                    HStack {
                        Text(self.model.leftBottomLabel?.label ?? "")
                            .foregroundColor(self.model.leftBottomLabel?.color ?? .black)
                            .font(self.fontFromUIFont(self.topBottomLabelsFont))
                        
                        Spacer(minLength: 0)
                        
                        Text(self.model.rightBottomLabel?.label ?? "")
                            .foregroundColor(self.model.rightBottomLabel?.color ?? .black)
                            .font(self.fontFromUIFont(self.topBottomLabelsFont))
                    }
                }*/
        }
    }
    
    func existNegativeValues() -> Bool {
        if let ranges = model.ranges, let range = ranges.first {
            if range.lowerBound < 0 {
                return true
            }
        }
        
        return false
    }
    
    func showValueColumnLabels(_ barWidth: CGFloat) -> Bool {
        guard let valueLabels = model.labelsForDimension else { return false }
        
        // check the column bar is wide enough to accommodate the label
        if let category = valueLabels.first {
            for str in category {
                let size = stringSize(str: str.value ?? "", font: columnLabelsFont)
                if size.width > barWidth {
                    return false
                }
            }
            
            return true
        }
        
        return false
    }
    
    func showDateColumnLables(_ barWidth: CGFloat) -> Bool {
        let tmp = model.titlesForCategory?.first?.compactMap { $0 }
        
        guard let dateLabels = tmp else { return false }
        // check the column bar is wide enough to accommodate the label
        if dateLabels.count > 0 {
            for str in dateLabels {
                let size = stringSize(str: str, font: dateLabelsFont)
                if size.width > barWidth {
                    return false
                }
            }
            
            return true
        }
        
        return false
    }
    
    func calTopLablesSize() -> CGSize {
        /*if let leftTopLabel = model.leftTopLabel?.label, let rightTopLabel = model.rightTopLabel?.label {
            let wholeStr = leftTopLabel + rightTopLabel
            
            return stringSize(str: wholeStr, font: topBottomLabelsFont)
        }*/
        
        return .zero
    }
    
    func showTopLables(in size: CGSize) -> Bool {
        if self.sizeCategory < ContentSizeCategory.accessibilityLarge && size.width > calTopLablesSize().width {
            return true
        }
        
        return false
    }
    
    func calBottomLablesSize() -> CGSize {
        /*if let leftBottomLabel = model.leftBottomLabel?.label, let rightBottomLabel = model.rightBottomLabel?.label {
            let wholeStr = leftBottomLabel + rightBottomLabel
            
            return stringSize(str: wholeStr, font: topBottomLabelsFont)
        }*/
        
        return .zero
    }
    
    
    func showBottomLables(in size: CGSize) -> Bool {
        if self.sizeCategory < ContentSizeCategory.accessibilityLarge && size.width > calBottomLablesSize().width {
            return true
        }
        
        return false
    }
    
    func calChartComponentsHeight(in size: CGSize, barWidth: CGFloat) -> (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        let dateLabels = model.titlesForCategory?.first?.compactMap({$0})
        
        var topLabelsHeight: CGFloat = 0
        var bottomLabelsHeight: CGFloat = 0
        var columnLabelsHeight: CGFloat = 0
        var dateLabelsHeight: CGFloat = 0
        var wholeBarsHeight = size.height
        var positiveLablesHeight: CGFloat = 0
        var negativeLabelsHeight: CGFloat = 0
        
        if showTopLables(in: size) {
            topLabelsHeight = calTopLablesSize().height
            wholeBarsHeight -= topLabelsHeight
        }
        
        if showBottomLables(in: size) {
            bottomLabelsHeight = calBottomLablesSize().height
            wholeBarsHeight -= bottomLabelsHeight
        }
        
        if showValueColumnLabels(barWidth) {
            columnLabelsHeight = stringSize(str: model.labelsForDimension!.first!.first!.value ?? "", font: columnLabelsFont).height
            wholeBarsHeight -= columnLabelsHeight
            positiveLablesHeight = columnLabelsHeight
            
            if existNegativeValues() {
                wholeBarsHeight -= columnLabelsHeight
                negativeLabelsHeight = columnLabelsHeight
            }
        }
        
        if showDateColumnLables(barWidth) {
            dateLabelsHeight = stringSize(str: dateLabels!.first!, font: dateLabelsFont).height
            wholeBarsHeight -= dateLabelsHeight
        }
        
        // if the frame height is not big enough then hide date labels
        if wholeBarsHeight < minHeightToShowLabels && dateLabelsHeight > 0 {
            wholeBarsHeight += dateLabelsHeight
            dateLabelsHeight = 0
        }
        
        // if the frame height is not big enough then hide volumn value labels
        if wholeBarsHeight < minHeightToShowLabels && positiveLablesHeight > 0 {
            wholeBarsHeight += positiveLablesHeight
            positiveLablesHeight = 0
            
            wholeBarsHeight += negativeLabelsHeight
            negativeLabelsHeight = 0
        }
        
        // if the frame height is not big enough then hide top labels
        if wholeBarsHeight < minHeightToShowLabels && topLabelsHeight > 0 {
            wholeBarsHeight += topLabelsHeight
            topLabelsHeight = 0
        }
        
        // if the frame height is not big enough then hide top labels
        if wholeBarsHeight < minHeightToShowLabels && bottomLabelsHeight > 0 {
            wholeBarsHeight += bottomLabelsHeight
            topLabelsHeight = 0
        }
        
        let minVal = model.ranges == nil ? 0 : min(0, model.ranges!.first!.lowerBound)
        let negativeBarsHeight = minVal >= 0 ? 0 : (CGFloat(model.normalizedValue(for: minVal, seriesIndex: 0)) * wholeBarsHeight)
        
        let positiveBarsHeight = wholeBarsHeight - negativeBarsHeight
        
        return (wholeBarsHeight, positiveBarsHeight, negativeBarsHeight, positiveLablesHeight, negativeLabelsHeight, dateLabelsHeight, topLabelsHeight, bottomLabelsHeight)
    }
    
    func columnLabel(for item: MicroChartDataItem, positive: Bool) -> String? {
        if positive {
            return item.value >= 0 ? (item.displayValue): nil
        }
        else {
            return item.value < 0 ? (item.displayValue): nil
        }
    }
    
    // n + (n-1) * 0.2 = n + (n - 1)/5 = (6n -1)/5
    func columnWidthAndSpace(in size: CGSize) -> (CGFloat, CGFloat) {
        let count = model.data[0].count
        var width = size.width * 5 / (CGFloat(6 * count) - 1)
        var space = width * 0.2
        if space < 2 {
            space = 2
        }
        else if space > 5 {
            space = 5
        }
        else {
            space = ceil(space)
        }
        width = (size.width - CGFloat((count - 1)) * space) / CGFloat(count)
        
        return (width, space)
    }
    
    func stringSize(str: String, font: UIFont) -> CGSize {
        let size = (str as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
        
        return size
    }
    
    func fontFromUIFont(_ font: UIFont) -> Font {
        let fontRef: CTFont = font as CTFont
        return Font(fontRef)
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
