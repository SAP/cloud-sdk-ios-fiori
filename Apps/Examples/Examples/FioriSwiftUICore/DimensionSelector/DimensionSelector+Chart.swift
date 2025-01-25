import Combine
import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct DimensionSelector_Chart: View {
    let segmentTitles = ["1min", "One day", "1year: 1day", "Three years: one week"]
    
    @ObservedObject var stockModel = Tests.stockModels[0]
    
    @State var widthMode: SegmentWidthMode = .intrinsic
    var cancellableSet: Set<AnyCancellable> = []
    var dimensionSelector: _DimensionSelector!
    
    init() {
        self.dimensionSelector = _DimensionSelector(segmentTitles: self.segmentTitles, selectedIndex: stockModel.indexOfStockSeries)
        let stockModel = self.stockModel
        self.dimensionSelector.selectionDidChangePublisher
            .sink(receiveValue: { index in
                stockModel.indexOfStockSeries = index ?? 0
            })
            .store(in: &self.cancellableSet)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            self.dimensionSelector

            self.chartView
        }
    }
    
    var chartView: some View {
        if self.stockModel.numOfSeries() > 0 {
            return AnyView(ChartView(self.stockModel))
                
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
