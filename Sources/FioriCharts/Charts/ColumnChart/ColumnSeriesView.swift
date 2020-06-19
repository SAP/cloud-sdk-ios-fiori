//
//  ColumnSeriesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/11/20.
//

import SwiftUI

struct ColumnSeriesView: View {
    @ObservedObject var model: ChartModel
    let tickValues: AxisTickValues
    let plotSeries: [ChartPlotRectData]
    let colorScheme: ColorScheme
    let rect: CGRect
    let isSelectionView: Bool
    
    var body: some View {
        return Group {
            // positive values
            if tickValues.plotMinimum >= 0 {
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(plotSeries, id: \.self) { item in
                        Rectangle()
                            .fill(self.columnColor(for: item))
                            .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale, height: item.rect.size.height * self.rect.size.height)
                    }
                }
                
            } else if tickValues.plotMaximum <= 0 { // negative values
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(plotSeries, id: \.self) { item in
                        VStack(alignment: .center, spacing: 0) {
                            Rectangle()
                                .fill(self.columnColor(for: item))
                                .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale, height: item.rect.size.height * self.rect.size.height)
                            Spacer(minLength: 0)
                        }
                    }
                    
                }
            } else { // mixed values
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(plotSeries, id: \.self) { item in
                        VStack(spacing: 0) {
                            // positive area
                            VStack(spacing: 0) {
                                Spacer(minLength: 0)
                                Rectangle()
                                    .fill(self.columnColor(for: item))
                                    .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale, height: self.columnHeight(from: item, isPositiveArea: true) * self.rect.size.height)
                            }.frame(height: (1 - self.tickValues.plotBaselinePosition) * self.rect.size.height)
                            
                            // negative area
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(self.columnColor(for: item))
                                    .frame(width: item.rect.size.width * self.rect.size.width * self.model.scale,
                                           height: self.columnHeight(from: item, isPositiveArea: false) * self.rect.size.height)
                                Spacer(minLength: 0)
                            }.frame(height: self.tickValues.plotBaselinePosition * self.rect.size.height)
                        }
                    }
                }
            }
        }
    }
    
    func columnColor(for item: ChartPlotRectData) -> Color {
        if !isSelectionView {
            return model.seriesAttributes[item.seriesIndex].palette.colors[0].color(colorScheme)
        } else {
            if item.selected {
                return model.seriesAttributes[item.seriesIndex].palette.fillColor.color(colorScheme)
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

//struct ColumnSeriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColumnSeriesView()
//    }
//}
