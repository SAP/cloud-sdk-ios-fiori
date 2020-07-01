//
//  WaterfallConnectingLinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/29/20.
//

import SwiftUI

struct WaterfallConnectingLinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    @Environment(\.layoutDirection) var layoutDirection
    
    let curCatIndex: Int
    let columnWidth: CGFloat
    let clusterSpace: CGFloat
    let height: CGFloat
    
    var body: some View {
        let maxDataCount = model.numOfCategories(in: 0)
        let pd = axisDataSource.plotData(model)
        let startPoint: CGPoint = CGPoint(x: columnWidth,
                                          y: yPos(for: pd[curCatIndex][0],
                                                  isTotal: isSubTotal(categoryIndex: curCatIndex),
                                                  isStart: true))
        
        let endPoint: CGPoint = curCatIndex == maxDataCount - 1 ? startPoint : CGPoint(x: columnWidth + clusterSpace,
                                                                                       y: yPos(for: pd[curCatIndex + 1][0],
                                                                                               isTotal: isSubTotal(categoryIndex: curCatIndex + 1),
                                                                                               isStart: false))
        
        return Group {
            if curCatIndex == maxDataCount - 1 {
                EmptyView()
            } else {
                LineShape(pos1: startPoint, pos2: endPoint, layoutDirection: layoutDirection)
                    .stroke(Color.preferredColor(.primary4), lineWidth: 1)
                .frame(width: columnWidth + clusterSpace, height: height)
            }
        }
    }

    func yPos(for item: ChartPlotRectData, isTotal: Bool, isStart: Bool) -> CGFloat {
        let isTop = (isTotal && item.value > 0) || (isStart && item.value > 0) || (!isStart && !isTotal && item.value < 0)
            
        if isTop {
            return height * (1.0 - item.rect.maxY)
        } else {
            return height * (1.0 - item.rect.minY)
        }
    }
    
    func isSubTotal(categoryIndex: Int) -> Bool {
        return categoryIndex == 0 ? true : model.indexesOfTotalsCategories.contains(categoryIndex)
    }
}

struct WaterfallConnectingLinesView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Tests.waterfallModels[0]
        let axisDataSource = WaterfallAxisDataSource()
        
        return WaterfallConnectingLinesView(curCatIndex: 1,
                                            columnWidth: 30,
                                            clusterSpace: 10, height: 200)
            .environmentObject(model)
            .environment(\.axisDataSource, axisDataSource)
            .frame(width: 300, height: 200)
    }
}
