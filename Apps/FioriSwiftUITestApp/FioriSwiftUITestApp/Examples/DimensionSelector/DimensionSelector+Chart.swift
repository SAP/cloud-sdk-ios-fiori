//
//  DimensionSelector+Chart.swift
//  FioriSwiftUITestApp
//
//  Created by Zhou, Bill on 4/1/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUI

struct DimensionSelector_Chart: View {
    @State var selectedIndex: Int?
    
    let segmentTitltes = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
    
    var body: some View {
        VStack {
            DimensionSelector(segmentTitles: segmentTitltes, selectedIndex: $selectedIndex)
            
            if selectedIndex != nil {
                ChartView(stockModel)
                    .frame(width: 400, height: 250)
            } else {
                NoDataView()
                    .frame(width: 400, height: 250)
            }
        }
    }
}

extension DimensionSelector_Chart {
    var stockModel: ChartModel {
        let model = Tests.stockModels[0]
        model.selectedSeriesIndex = selectedIndex
        return model
    }
}

struct NoDataView: View {
    var body: some View {
        Text("No Data")
    }
}

struct DimensionSelector_Chart_Previews: PreviewProvider {
    static var previews: some View {
        DimensionSelector_Chart()
    }
}
