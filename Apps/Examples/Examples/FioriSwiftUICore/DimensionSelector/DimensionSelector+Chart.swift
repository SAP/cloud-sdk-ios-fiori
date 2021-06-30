import Combine
import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct DimensionSelector_Chart: View {
    let segmentTitltes = ["intraday: 1min", "one day: 1min", "1year:1day", "3years:1week"]
    
    @ObservedObject var stockModel = Tests.stockModels[0]
    
    var cancellableSet: Set<AnyCancellable> = []
    
    var dimensionSelector: DimensionSelector!
    
    init() {
        self.dimensionSelector = DimensionSelector(segmentTitles: self.segmentTitltes, selectedIndex: stockModel.indexOfStockSeries)
        let stockModel = self.stockModel
        self.dimensionSelector.selectionDidChangePublisher
            .sink(receiveValue: { index in
                stockModel.indexOfStockSeries = index ?? 0
            })
            .store(in: &self.cancellableSet)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            dimensionSelector
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

private struct NoDataView: View {
    var body: some View {
        Text("No Data")
    }
}

struct DimensionSelector_Chart_Previews: PreviewProvider {
    static var previews: some View {
        DimensionSelector_Chart()
    }
}
