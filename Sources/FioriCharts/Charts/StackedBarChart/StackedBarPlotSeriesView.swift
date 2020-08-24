//
//  StackedBarPlotSeriesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 8/18/20.
//

import SwiftUI

struct StackedBarPlotSeriesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    
    let plotSeries: [ChartPlotData]
    let rect: CGRect
    let isSelectionView: Bool
    
    var body: some View {
        let tickValues = model.numericAxisTickValues
        
        return Group {
            // positive values
            if tickValues.plotMinimum >= 0 {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(plotSeries, id: \.self) { item in
                            Rectangle()
                                .fill(self.columnColor(for: item))
                                .frame(width: item.rect.size.width * self.rect.size.width,
                                       height: item.rect.size.height * self.rect.size.height * self.model.scale)
                        }
                        Spacer(minLength: 0)
                    }
                }.frame(width: rect.size.width)
            } else if tickValues.plotMaximum <= 0 { // negative values
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Spacer(minLength: 0)
                        ForEach(plotSeries.reversed(), id: \.self) { item in
                            Rectangle()
                                .fill(self.columnColor(for: item))
                                .frame(width: item.rect.size.width * self.rect.size.width, height: item.rect.size.height * self.rect.size.height * self.model.scale)
                        }
                    }
                }.frame(width: rect.size.width)
            } else { // mixed values
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        // negative area
                        HStack(spacing: 0) {
                            Spacer(minLength: 0)
                            
                            ForEach(plotSeries, id: \.self) { item in
                                Rectangle()
                                    .fill(self.columnColor(for: item))
                                    .frame(width: self.columnWidth(from: item, isPositiveArea: false) * self.rect.size.width ,
                                           height: item.rect.size.height  * self.rect.size.height * self.model.scale)
                            }
                        }.frame(width: tickValues.plotBaselinePosition * self.rect.size.width)
                        
                        // positive area
                        HStack(spacing: 0) {
                            ForEach(plotSeries, id: \.self) { item in
                                Rectangle()
                                    .fill(self.columnColor(for: item))
                                    .frame(width: self.columnWidth(from: item, isPositiveArea: true) * self.rect.size.width, height: item.rect.size.height * self.rect.size.height * self.model.scale)
                            }
                            
                            Spacer(minLength: 0)
                        }.frame(width: (1 - tickValues.plotBaselinePosition) * self.rect.size.width)
                    }
                }.frame(width: rect.size.width)
            }
        }
    }
    
    func columnColor(for item: ChartPlotData) -> Color {
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
    
    func columnWidth(from rectData: ChartPlotData, isPositiveArea: Bool) -> CGFloat {
        if (rectData.value >= 0 && isPositiveArea) || (rectData.value < 0 && !isPositiveArea) {
            return rectData.rect.size.width
        } else {
            return 0
        }
    }
}

struct StackedBarPlotSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Tests.lineModels[2]
        model.chartType = .stackedBar
        let axisDataSource = BarAxisDataSource()
        let pd = axisDataSource.plotData(model)
        
        return StackedBarPlotSeriesView(plotSeries: pd[5],
                              rect: CGRect(x: 0, y: 0, width: 300, height: 200),
                              isSelectionView: false)
                .environmentObject(model)
                .environment(\.axisDataSource, axisDataSource)
                .previewLayout(.sizeThatFits)
    }
}
