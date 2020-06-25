//
//  StackedColumnSeriesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/15/20.
//

import SwiftUI

struct StackedColumnSeriesView: View {
    @ObservedObject var model: ChartModel

    let tickValues: AxisTickValues
    let plotSeries: [ChartPlotRectData]
    let rect: CGRect
    let isSelectionView: Bool
    
    var body: some View {
        return Group {
            // positive values
            if tickValues.plotMinimum >= 0 {
                VStack(alignment: .center, spacing: 0) {
                    ForEach(plotSeries.reversed(), id: \.self) { item in
                        Rectangle()
                            .fill(self.columnColor(for: item))
                            .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale, height: item.rect.size.height * self.rect.size.height)
                    }
                }
                
            } else if tickValues.plotMaximum <= 0 { // negative values
                VStack(alignment: .center, spacing: 0) {
                    ForEach(plotSeries, id: \.self) { item in
                        Rectangle()
                            .fill(self.columnColor(for: item))
                            .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale, height: item.rect.size.height * self.rect.size.height)
                    }
                    Spacer(minLength: 0)
                }
            } else { // mixed values
                VStack(alignment: .center, spacing: 0) {
                    // positive area
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        
                        ForEach(plotSeries.reversed(), id: \.self) { item in
                            Rectangle()
                                .fill(self.columnColor(for: item))
                                .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale,
                                       height: self.columnHeight(from: item, isPositiveArea: true) * self.rect.size.height)
                        }
                    }.frame(height: (1 - self.tickValues.plotBaselinePosition) * self.rect.size.height)
                    
                    // negative area
                    VStack(spacing: 0) {
                        ForEach(plotSeries, id: \.self) { item in
                            Rectangle()
                                .fill(self.columnColor(for: item))
                                .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale,
                                       height: self.columnHeight(from: item, isPositiveArea: false) * self.rect.size.height)
                        }
                        Spacer(minLength: 0)
                    }.frame(height: self.tickValues.plotBaselinePosition * self.rect.size.height)
                }
            }
        }
    }
    
    func columnColor(for item: ChartPlotRectData) -> Color {
        if !isSelectionView {
            return model.colorAt(seriesIndex: item.seriesIndex, categoryIndex: item.categoryIndex)
        } else {
            if item.selected {
                return model.fillColorAt(seriesIndex: item.seriesIndex, categoryIndex: item.categoryIndex)
            } else {
                return .clear
            }
        }
    }
    
    func columnHeight(from rectData: ChartPlotRectData, isPositiveArea: Bool) -> CGFloat {
        if (rectData.value >= 0 && isPositiveArea) || (rectData.value < 0 && !isPositiveArea) {
            return rectData.rect.size.height
        } else {
            return 0
        }
    }
}

//struct StackedColumnSeriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        StackedColumnSeriesView()
//    }
//}
