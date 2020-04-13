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
import Combine

struct DimensionSelector_Chart: View {
    
    let segmentTitltes = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
    
    @State var cancellable: AnyCancellable? = nil
    @State var selectedIndex: Int?
    
    var selectorView: DimensionSelector!
    var receiver: CurrentValueSubject<Int?, Never>?
    
    init() {
        selectorView = DimensionSelector(segmentTitles: segmentTitltes, selectedIndex: selectedIndex)
        receiver = selectorView.selectionDidChangePublisher
        self._cancellable = State(initialValue: self.receiver?.sink(receiveValue: { (index) in
            self.selectedIndex = index
        }))
//        setup()
    }

    var body: some View {

        let vStack = VStack {
            selectorView
            
            if selectedIndex != nil {
                ChartView(stockModel)
                    .frame(width: 400, height: 250)
            } else {
                NoDataView()
                    .frame(width: 400, height: 250)
            }
        }
        
        return vStack
    }
    
    func setup() {
        
//        DispatchQueue.main.async {
//            self.cancellable = self.receiver?.sink(receiveValue: { (index) in
//                print("selected: \(index ?? -1)")
//                self.selectedIndex = index
//            })
//        }
    }
//
//    func makeChartView(index: Int?) -> AnyView {
//        if index != nil {
//            return AnyView(ChartView(self.stockModel))
//        }
//
//        return AnyView(NoDataView())
//    }
    
//    func makeChartView(publisher: CurrentValueSubject<Int?, Never>?) -> some View {
//        var chartView: AnyView = AnyView(NoDataView())
//
//        let _ = publisher?.sink(receiveValue: { (selectedIndex) in
//            print("get: \(selectedIndex)")
//            if selectedIndex != nil {
//               chartView = AnyView(ChartView(self.stockModel))
//            }
//        })
//        return chartView
//    }
}

extension DimensionSelector_Chart {
    var stockModel: ChartModel {
        let model = Tests.stockModels[0]
        model.selectedSeriesIndex = 1
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
