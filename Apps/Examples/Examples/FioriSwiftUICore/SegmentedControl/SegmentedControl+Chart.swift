//
//  DimensionSelector+Chart.swift
//  FioriSwiftUITestApp
//
//  Created by Zhou, Bill on 4/1/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUICore
import Combine

struct SegmentedControl_Chart: View {
    
    let segmentTitltes = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
    
    @ObservedObject var stockModel = Tests.stockModels[0]
    
    var cancellableSet: Set<AnyCancellable> = []
    
    var segmentedControl: SegmentedControl!
    
    init() {
        segmentedControl = SegmentedControl(segmentTitles: segmentTitltes, selectedIndex: stockModel.indexOfStockSeries)
        let stockModel = self.stockModel
        segmentedControl.selectionDidChangePublisher
            .sink(receiveValue: { (index) in
                stockModel.indexOfStockSeries = index ?? 0
            })
            .store(in: &cancellableSet)
    }

    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            segmentedControl
            chartView
        }
    }
    
    var chartView: some View {
        if stockModel.numOfSeries() > 0 {
            return AnyView(ChartView(stockModel))
                
        } else {
            return AnyView(NoDataView())
        }
    }
}

struct NoDataView: View {
    var body: some View {
        Text("No Data")
    }
}

struct DimensionSelector_Chart_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl_Chart()
    }
}
