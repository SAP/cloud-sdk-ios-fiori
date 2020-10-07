//
//  ComboSeriesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/30/20.
//

import SwiftUI

struct ComboSeriesColumnView: View {
    @EnvironmentObject var model: ChartModel
    
    let plotColumn: ChartPlotData
    let rect: CGRect
    let isSelectionView: Bool
    
    var body: some View {
        let seriesIndex = plotColumn.seriesIndex
        let isSecondary = model.indexesOfSecondaryValueAxis.contains(seriesIndex)
        let tickValues = isSecondary ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
        
        return Group {
            // positive values
            if tickValues.plotMinimum >= 0 {
                Rectangle()
                    .fill(self.columnColor(for: plotColumn))
                    .frame(width: plotColumn.rect.size.width * self.rect.size.width * self.model.scale, height: plotColumn.rect.size.height * self.rect.size.height)
                
            } else if tickValues.plotMaximum <= 0 { // negative values
                
                VStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .fill(self.columnColor(for: plotColumn))
                        .frame(width: plotColumn.rect.size.width * self.rect.size.width * self.model.scale, height: plotColumn.rect.size.height * self.rect.size.height)
                    Spacer(minLength: 0)
                }
            } else { // mixed values
                VStack(spacing: 0) {
                    // positive area
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        Rectangle()
                            .fill(self.columnColor(for: plotColumn))
                            .frame(width: plotColumn.rect.size.width * self.rect.size.width * self.model.scale, height: self.columnHeight(from: plotColumn, isPositiveArea: true) * self.rect.size.height)
                    }.frame(height: (1 - tickValues.plotBaselinePosition) * self.rect.size.height)
                    
                    // negative area
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(self.columnColor(for: plotColumn))
                            .frame(width: plotColumn.rect.size.width * self.rect.size.width * self.model.scale,
                                   height: self.columnHeight(from: plotColumn, isPositiveArea: false) * self.rect.size.height)
                        Spacer(minLength: 0)
                    }.frame(height: tickValues.plotBaselinePosition * self.rect.size.height)
                }
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
    
    func columnHeight(from rectData: ChartPlotData, isPositiveArea: Bool) -> CGFloat {
        if (rectData.value >= 0 && isPositiveArea) || (rectData.value < 0 && !isPositiveArea) {
            return rectData.rect.size.height
        } else {
            return 0
        }
    }
}

struct ComboSeriesView: View {
    @EnvironmentObject var model: ChartModel
    
    let plotSeries: [ChartPlotData]
    let rect: CGRect
    let isSelectionView: Bool
    
    var body: some View {
        let plots = plotSeries.compactMap {
            model.indexesOfColumnSeries.contains($0.seriesIndex) ? $0 : nil
        }
        
        return HStack(alignment: .bottom, spacing: 0) {
            ForEach(plots, id: \.self) { item in
                ComboSeriesColumnView(plotColumn: item, rect: self.rect, isSelectionView: self.isSelectionView)
            }
        }
    }
}

struct ComboSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        let chartContext = ComboChartContext()
        let pd = chartContext.plotData(Tests.comboModels[0])
        
        return ComboSeriesView(plotSeries: pd[0],
                               rect: CGRect(x: 0, y: 0, width: 300, height: 200),
                               isSelectionView: false)
            .environmentObject(Tests.comboModels[0])
            .environment(\.chartContext, chartContext)
            .frame(width: 300, height: 200)
    }
}
